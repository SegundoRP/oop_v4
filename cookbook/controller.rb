require_relative 'view'
require_relative 'recipe'
require_relative "scrape_allrecipes_service"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def add
    # 1. Ask user for name and description
    name = @view.ask_user_for_stuff('name')
    description = @view.ask_user_for_stuff('description')
    rating = @view.ask_user_for_stuff('rating')
    prep_time = @view.ask_user_for_stuff('prep_time')

    # 2. Create instance of recipe
    recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    # 3. Add to cookbook
    @cookbook.create(recipe)
    # 4. Show all recipes
    display_recipes
  end

  def list
    display_recipes
  end

  def remove
    display_recipes
    # 1. Ask user for index recipe
    index = @view.ask_user_for_index
    # 2. Remove from cookbook
    @cookbook.destroy(index)
    # 3. Show all recipes
    display_recipes
  end

  def mark_as_done
    display_recipes
    # 1. Ask user which mark
    index = @view.ask_user_for_index
    # 2. Mark recipe
    @cookbook.mark_recipe_as_done(index)
    display_recipes
  end

  def import
    # 1. Ask user for a keyword
    word = @view.ask_user_for("search")
    # 2. Scrape All Recipes
    results = ScrapeAllrecipesService.new(word).call
    # 3. Display results
    @view.display_recipes(results)
    # 4. Ask for the recipe to import
    index = @view.ask_user_for_index
    # 5. Create and add to cookbook
    @cookbook.create(results[index])
    # 6. Display
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
