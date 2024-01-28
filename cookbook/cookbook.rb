require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_to_csv
  end

  def create(recipe)
    @recipes << recipe
    save_to_csv
  end

  def all
    @recipes
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_to_csv
  end

  def mark_recipe_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    save_to_csv
  end

  private

  def save_to_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['name', 'description', 'rating', 'prep_time', 'done']
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done?]
      end
    end
  end

  def load_to_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:done] = row[:done] == 'true'
      @recipes << Recipe.new(row)
    end
  end
end
