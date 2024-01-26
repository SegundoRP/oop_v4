class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_user_for_name
    puts "What is the name of the recipe do you want to add?"
    print '> '
    gets.chomp
  end

  def ask_user_for_description
    puts "What is the description of the recipe do you want to add?"
    print '> '
    gets.chomp
  end

  def ask_user_for_index
    puts "What is the recipe you want to remove?"
    print '> '
    gets.chomp.to_i - 1
  end
end
