require 'lightspeed/base'
require 'lightspeed/categories'
require 'lightspeed/items'

module Lightspeed
  class Account < Lightspeed::Base
    attr_accessor :id, :name, :link

    def client
      owner
    end

    def items
      item_proxy
    end

    def categories
      category_proxy
    end

    def instantiate(*args)
      records = client.instantiate(self, *args)
    end

    private

    def self.id_field
      "accountID"
    end

    def item_proxy
      @item_proxy ||= Lightspeed::Items.new(self)
    end

    def category_proxy
      @category_proxy ||= Lightspeed::Categories.new(self)
    end
  end
end
