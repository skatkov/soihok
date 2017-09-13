require_relative '../test_helper'
require_relative '../../lib/prismic_wrapper'

class PrismicWrapperTest < Minitest::Test
  def test_wrapper
    products = PrismicWrapper.products
    assert_equal 7, products.count
  end
end
