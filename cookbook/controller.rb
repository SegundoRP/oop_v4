require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def add
    # 1. Ask user for name and description
    name = @view.ask_user_for_name
    description = @view.ask_user_for_description
    # 2. Create instance of recipe
    recipe = Recipe.new(name, description)
    # 3. Add to cookbook
    @cookbook.create(recipe)
    # 4. Show all recipes
    display_recipes
  end

  def list
    display_recipes
  end

  def remove
    # 1. Ask user for index recipe
    index = @view.ask_user_for_index
    # 2. Remove from cookbook
    @cookbook.destroy(index)
    # 3. Show all recipes
    display_recipes
  end

  private

  def display_recipes
    # 1. Get all recipes from cookbook
    recipes = @cookbook.all
    # 2. Display recipes
    @view.display_recipes(recipes)
  end
end
