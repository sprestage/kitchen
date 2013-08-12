DEBUG = TRUE

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

INGREDIENTS_DEFAULT = []
DIRECTIONS_DEFAULT = ""

INGREDIENTS_NON_DEFAULT = ["ingred_one","ingred_two","ingred_three"]
DIRECTIONS_NON_DEFAULT = "Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  Lengthy directions.  This is a set of very lengthy directions.  "


KITCHEN = <<END



||=================================================================||
||                          #{KITCHEN_NAME_DEFAULT.upcase}
||                          KITCHEN                                ||
||=================================================================||
||                                                                 ||
||      Welcome to your Kitchen Manager.  In your Kitchen you      ||
||      have a Pantry, where you keep all your ingredients.        ||
||      You also have a Recipe Book where you keep all your        ||
||      recipes.     -sprestage                                    ||
||                                                                 ||
||=================================================================||
||                         COMMANDS                                ||
||                                                                 ||
||          AR - Add Recipe                                        ||
||          TODO: CR - Change Recipe                                     ||
||          PR - Print Recipes                                     ||
||          DR - Delete Recipe                                     ||
||                                                                 ||
||          AP - Add item to Pantry                                ||
||          TODO: CP - Change item in the Pantry                         ||
||          PP - Print the Pantry                                  ||
||          DP - Delete item in Pantry                             ||
||                                                                 ||
||          TODO: SP - Save Pantry to file                               ||
||          TODO: SR - Save Recipes to file                              ||
||          TODO: LP - Load Pantry from File (this will also save        ||
||                 existing recipes to current Pantry File)        ||
||          TODO: LR - Load Recipes from File (this will also save       ||
||                 existing recipes to current Recipe File)        ||
||          TODO: PF - Change to different Pantry File                   ||
||          TODO: RF - Change to different Recipe File                   ||
||                                                                 ||
||          PC - Print this list of Commands                       ||
||                                                                 ||
||          QQ - Quit program.  This will save the Pantry and      ||
||                 the Recipes to file.                            ||
||                                                                 ||
||=================================================================||

END