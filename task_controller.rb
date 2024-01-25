require_relative 'task_view'
require_relative 'task'

class TaskController
  def initialize(repository)
    @view = TaskView.new
    @repository = repository
  end

  def add
    # 1. Ask to user the description of the task
    description = @view.ask_user_for_description
    # 2. Create a new task instance with the description
    task = Task.new(description)
    # 3. Add to the repository
    @repository.create(task)
  end

  def list
    # 1. Ask to the repository for all the tasks
    tasks = @repository.all
    # 2. Ask to the view to print all the tasks
    @view.display_tasks(tasks)
  end

  def remove
    # 1. Ask to user which task want to remove
    index = @view.ask_user_for_index_remove
    # 2. Remove!
    @repository.destroy(index)
  end

  def mark_as_done
    # 1. Ask to user which task want to mark as done
    index = @view.ask_user_for_index_mark_as_done
    # 2. Find task
    task = @repository.find(index)
    # 3. Mark as done!
    task.mark_as_done!
  end
end
