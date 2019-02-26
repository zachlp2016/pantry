class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock.empty? == true
      @stock[ingredient] = 0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, count)
    if @stock.empty? == true || @stock[ingredient] == nil
      @stock[ingredient] = count
    else
      @stock[ingredient] += count
    end
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient|
      @stock.each do |object|
        if object[0].name == ingredient[0].name
          @stock[ingredient[0]] >= ingredient[1]
        end
        false
      end
    end
  end
end
