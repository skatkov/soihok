require_relative '../test_helper'
require_relative '../../lib/prismic_wrapper'

class PrismicWrapperTest < Minitest::Test
  def test_wrapper
    VCR.use_cassette('wrapper_products') do |variable|
      products = PrismicWrapper.new.products
      assert_equal 7, products.count
    end
  end
end
