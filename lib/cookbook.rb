require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row) do |row|
      @recipes << Recipe.new(row['name'], row['description'])
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['name', 'description']
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
