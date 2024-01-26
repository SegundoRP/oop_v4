require_relative 'recipe'
require_relative 'cookbook'
require_relative 'controller'
require_relative 'router'

recipe1 = Recipe.new('Lomo saltado', 'Sabrosa mezcla carne y más')
recipe2 = Recipe.new('Ají de pollo', 'Deliciosa masa amarilla')
csv_file = File.join(__dir__, 'recipes.csv')
cookbook = Cookbook.new(csv_file)
controller = Controller.new(cookbook)
router = Router.new(controller)

router.run

# cookbook.create(recipe1)
# cookbook.create(recipe2)
# p cookbook.all
