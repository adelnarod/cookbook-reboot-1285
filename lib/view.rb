class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}: #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_user_for(stuff)
    puts "Give us a #{stuff}"
    gets.chomp
  end
end
