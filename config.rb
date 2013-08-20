#DEBUG = FALSE 	#To quiet the output when running unit tests in rspec.  For development.
DEBUG = TRUE 	#To run successfully for users.  For production.

PANTRY_PATH_DEFAULT = "/Users/susan/Documents/myPantry.txt"
RECIPE_BOOK_PATH_DEFAULT = "/Users/susan/Documents/myRecipes.txt"
RECIPE_BOOK_PATH_NON_DEFAULT = "/Users/susan/Documents/susanRecipes.txt"

FILE_NAME_PREFIX = "/Users/susan/Documents/susan"
PANTRY_PATH = "#{FILE_NAME_PREFIX}Pantry.txt"
RECIPE_BOOK_PATH = "#{FILE_NAME_PREFIX}Recipes.txt"

KITCHEN_NAME_DEFAULT = "My"

KITCHEN_NAME_NON_DEFAULT = "Susan's"

IS_FROZEN_DEFAULT = "FALSE"
IS_STAPLE_DEFAULT = "TRUE"
CATEGORY_DEFAULT = ""

IS_FROZEN_NON_DEFAULT = "TRUE"
IS_STAPLE_NON_DEFAULT = "FALSE"
CATEGORY_NON_DEFAULT = "a category"

RECIPE_BOOK_DEFAULT = []

INGREDIENTS_DEFAULT = ["an ingredient"]
DIRECTIONS_DEFAULT = "Simple directions."

INGREDIENTS_NON_DEFAULT = ["ingred_one","ingred_two","ingred_three"]
DIRECTIONS_NON_DEFAULT = "Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  "

LINE_MARKER = "****************************************************************************************************"

KITCHEN = <<END



||=================================================================================||
||                                  #{KITCHEN_NAME_DEFAULT.upcase}
||                                  KITCHEN                                        ||
||=================================================================================||
||                                                                                 ||
||      Welcome to your Kitchen Manager.  In your Kitchen you have a               ||
||      Pantry, where you keep all your ingredients.  You also have a              ||
||      Recipe Book where you keep all your recipes.     -sprestage                ||
||                                                                                 ||
||=================================================================================||
||                              COMMANDS                                           ||
||                                                                                 ||
||          AP - Add item to Pantry                                                ||
||          CP - Change item in the Pantry                                         ||
||          PP - Print the Pantry                                                  ||
||          DP - Delete item in Pantry                                             ||
||                                                                                 ||
||          AR - Add Recipe                                                        ||
||          CR - Change Recipe                                                     ||
||          PR - Print Recipes                                                     ||
||          DR - Delete Recipe                                                     ||
||                                                                                 ||
||          SP - Save Pantry to file                                               ||
||          SR - Save Recipes to file                                              ||
||          LP - Load new Pantry from specified file (this will also save existing ||
||                 data to the current file before changing to the new file)       ||
||          LR - Load new Recipe Book from specified file (this will also save     ||
||                 existing recipes to current Recipe Book file before changing    ||
||                 to new file)                                                    ||
||                                                                                 ||
||          PC - Print this list of Commands                                       ||
||                                                                                 ||
||          QQ - Quit program.  This will save the Pantry and                      ||
||                 the Recipes to file.                                            ||
||                                                                                 ||
||=================================================================================||

END