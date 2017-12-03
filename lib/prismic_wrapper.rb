# frozen_string_literal: true
require 'prismic'
require 'time'

class PrismicWrapper
  PRODUCT_TYPE = 'product'
  API_URL = 'https://soihok.prismic.io/api'
  Product = Struct.new(:name, :photo, :description, :type, :price, :ingredients)

  def initialize
    @api = Prismic.api(API_URL)
  end

  def products(language = '*')
    api.query(Prismic::Predicates.at('document.type', PRODUCT_TYPE), {"lang" => language}).map do |product|
      fragments = product.fragments
      Product.new(
          fragments['name'].blocks.first.text,
          fragments['photo'].url,
          fragments['description'].blocks.first.text,
          #fragments['type'].blocks.first.text,
          fragments['price'].blocks.first.text,
          #fragments['ingredients'].blocks.first.text
        )
    end
  end

  private

  attr_reader :api
end
