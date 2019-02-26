class Recipe

  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, required)
    @ingredients_required[ingredient] = required
  end

  def amount_required(ingredient)
    @ingredients_required.each do |required|
      if required[0].name == ingredient.name
        return required[-1]
      end
    end
  end

  def ingredients
    ingredients_arr = []
    @ingredients_required.each do |ingredient|
      ingredients_arr << ingredient[0]
    end
    return ingredients_arr
  end

  def total_calories
    ingredients.sum do |ingredient|
      ingredient.calories * amount_required(ingredient)
    end
  end
end
