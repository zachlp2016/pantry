require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_recipe_class_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_recipe_has_a_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_recipe_starts_with_no_ingredients_required
    hash = {}
    assert_equal hash, @mac_and_cheese.ingredients_required
  end

  def test_recipe_can_add_ingredients_required
    hash = {
          @cheese => 2,
          @mac => 8
        }

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal hash, @mac_and_cheese.ingredients_required
  end

  def test_recipe_has_an_amount_required
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_recipe_has_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
  end

  def test_recipe_has_total_calories
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 440, @mac_and_cheese.total_calories
  end
end
