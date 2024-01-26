class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    puts "\n"
    puts "Welcome to the Cookbook"
    puts "_______________________"
    loop do
      options_menu
      action = gets.chomp.to_i
      print `clear`
      actions_menu(action)
    end
  end

  private

  def options_menu
    puts "\n"
    puts "What do you want to do next?"
    puts "1. Add a recipe"
    puts "2. List all recipes"
    puts "3. Remove a recipe"
    puts "4. Exit the program"
  end

  def actions_menu(action)
    case action
    when 1 then @controller.add
    when 2 then @controller.list
    when 3 then @controller.remove
    when 4 then exit
    else
      puts "Please type 1, 2, 3 or 4 :)"
    end
  end
end
