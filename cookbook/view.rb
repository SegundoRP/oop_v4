class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? 'X' : ''
      puts "#{index + 1}. #{status} #{recipe.name}: #{recipe.description} - #{recipe.rating}/5 - #{recipe.prep_time}"
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

  def ask_user_for_stuff(stuff)
    puts "#{stuff.capitalize}"
    print "> "
    gets.chomp
  end

  def ask_user_for_index
    puts "Which recipe?"
    print '> '
    gets.chomp.to_i - 1
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
