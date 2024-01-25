class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      options_menu
      action = gets.chomp.to_i
      actions_menu(action)
    end
  end

  def options_menu
    puts "\n"
    puts "Welcome to Task Manager"
    puts "_______________________"
    puts "\n"
    puts "1. Add a task"
    puts "2. List all tasks"
    puts "3. Mark a task as done"
    puts "4. Remove a task"
    puts "5. Exit the program"
  end

  def actions_menu(action)
    case action
    when 1 then @controller.add
    when 2 then @controller.list
    when 3 then @controller.mark_as_done
    when 4 then @controller.remove
    when 5 then exit
    else
      puts "Please type 1, 2, 3, 4 or 5 :)"
    end
  end
end
