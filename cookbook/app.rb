require_relative 'recipe'
require_relative 'cookbook'
require_relative 'controller'
require_relative 'router'

csv_file = File.join(__dir__, 'recipes.csv')
# CSV_FILE = File.join(File.dirname(__FILE__), 'recipes.csv')
cookbook = Cookbook.new(csv_file)
controller = Controller.new(cookbook)
router = Router.new(controller)

router.run

# cookbook.create(recipe1)
# cookbook.create(recipe2)
# p cookbook.all
