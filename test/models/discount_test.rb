require 'test_helper'

class DiscountTest < ActiveSupport::TestCase
  test "discount attributes must not be empty" do
    discount = Discount.new
    assert discount.invalid?
    assert discount.errors[:titulo].any?
    assert discount.errors[:precio].any?
    assert discount.errors[:vencimiento].any?
    assert discount.errors[:equipment_id].any?
  end
end
