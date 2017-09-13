# frozen_string_literal: true
require 'prismic'
require 'time'

class PrismicWrapper
  PRODUCT_TYPE = 'product'

  Product = Struct.new(:name, :photo, :description, :type, :price, :ingredients)

  def self.products
    @api = Prismic.api('https://soihok.prismic.io/api')
    @api.query(Prismic::Predicates.at('document.type', PRODUCT_TYPE)).map do |product|
      fragments = product.fragments
      Product.new(
          fragments['name'].blocks.first.text,
          fragments['photo'].url,
          fragments['description'].blocks.first.text,
          fragments['type'].blocks.first.text,
          fragments['price'].blocks.first.text,
          fragments['ingredients'].blocks.first.text
        )
    end
  end
end
