require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
  test "equipment attributes must not be empty" do
	equipment = Equipment.new
	assert equipment.invalid?
	assert equipment.errors[:name].any?
	assert equipment.errors[:precio].any?
	assert equipment.errors[:currency_id].any?
	assert equipment.errors[:description].any?
  end

  test "equipment price must be positive" do
	equipment = Equipment.new(name:"My Book Title",
							  precio: 10,
							  currency_id: "hola",
							  description: "adios")
	equipment.precio = -1
	assert equipment.invalid?
	assert_equal ["must be greater than or equal to 0.01"], equipment.errors[:precio]
	equipment.precio = 0
	assert equipment.invalid?
	assert_equal ["must be greater than or equal to 0.01"], equipment.errors[:precio]
	equipment.precio = 1
	assert equipment.valid?
  end

  test "should not equipment post without name" do
  	equipment = Equipment.new
  	assert_not equipment.save, "Save without name"
  end
end