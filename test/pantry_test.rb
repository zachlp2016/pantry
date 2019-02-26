require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @pantry = Pantry.new
  end

  def test_pantry_class_exists
    assert_instance_of Pantry, @pantry
  end

  def test_pantry_starts_with_no_stock
    hash = {}
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal hash, @pantry.stock
  end

  def test_pantry_stock_starts_with_no_ingredients
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_pantry_can_restock_ingredients
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_pantry_has_not_enough_ingredients_for_method
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

  def test_now_has_enough_ingredients_for
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    @pantry.restock(@mac, 8)
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end

#
# Use TDD to build a `Pantry` class that responds to the following interaction pattern:
