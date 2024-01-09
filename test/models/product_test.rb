require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test 'should be invalid without the required attributes' do
    product = Product.new

    assert_not product.valid?
    assert_not_empty product.errors.full_messages
  end

  test 'should be valid with the required attributes' do
    product = products(:one)

    assert product.valid?
  end

  test 'should be invalid with a duplicate title' do
    product = products(:one)
    product.title = products(:two).title

    assert_not product.valid?
    assert_not_empty product.errors.full_messages
  end

end
