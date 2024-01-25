class TaskView
  def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      done = task.done? ? 'X' : ''
      puts "#{index + 1} - [ #{done} ] #{task.description}"
    end
  end

  def ask_user_for_description
    puts "Which task do you want to add?"
    print "> "
    gets.chomp
  end

  def ask_user_for_index_remove
    puts "Which task do you want to remove?"
    print "> "
    gets.chomp.to_i - 1
  end

  def ask_user_for_index_mark_as_done
    puts "Which task do you want to mark as done?"
    print "> "
    gets.chomp.to_i - 1
  end
end
