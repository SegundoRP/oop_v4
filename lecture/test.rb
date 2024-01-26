require_relative 'task'
require_relative 'task_repository'
require_relative 'task_controller'
require_relative 'router'

task1 = Task.new('Comer')
task_repository = TaskRepository.new
task_controller = TaskController.new(task_repository)
router = Router.new(task_controller)

# task_controller.add
# task_controller.add
# task_controller.add

# task_controller.list
# task_controller.remove
# task_controller.list
# task_controller.mark_as_done
# task_controller.list

router.run
