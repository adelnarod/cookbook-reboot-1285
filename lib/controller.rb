require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_recipes(@cookbook.all)
  end

  def add
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    recipe = Recipe.new(name, description)
    @cookbook.create(recipe)
    list
  end

  def remove
    list
    index = @view.ask_user_for("index").to_i - 1
    @cookbook.destroy(index)
    list
  end
end
