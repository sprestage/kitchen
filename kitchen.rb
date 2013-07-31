#!/usr/bin/env ruby
PANTRY_PATH_DEFAULT = "~/Documents/myPantry.txt"
RECIPE_BOOK_PATH_DEFAULT = "~/Documents/myRecipes.txt"
CATEGORY_DEFAULT = ""
IS_FROZEN_DEFAULT = FALSE
IS_STAPLE_DEFAULT = TRUE
INGREDIENTS_DEFAULT = []
DIRECTIONS_DEFAULT = ""

#TODO - OPEN QUESTIONS 
#	1. At what point is this code file too big, so it should 
# 		be broken up into multiple .rb files?  What is the best
#		way to go about this?  Existing conventions?  Best answer
#		may be to split pieces out as they are completed (or nearly).
#		Becomes HIGH if file becomes unwieldy.
#	2. Should the recipe ingredients be called "pantry_item"s instead?	

#TODO - FEATURES
#	1. Locally store all recipes.
#	2. Locally store all panty items.
#	3. Save all recipes and pantry items to file.
#	4. Load kitchen data from given file, warn if file not present or is empty.
#	5. Set up user interface:
#		A. add recipe
#			i. enum the possible categories here...but maybe not.  discuss possibilities
#		B. change recipe
#		C. list recipes in kitchen
#			i. list all recipes
#			ii. list just recipes fitting parameters
#		D. delete recipe
#		E. add panty item
#		F. change pantry item
#		G. list pantry items in kitchen
#			i. list all pantry items
#			ii. list pantry items by category
#			iii. list only pantry items in given category
#			iv. list frozen/not frozen pantry items
#			v. list staple/not staple pantry items
#			vi. list pantry items needed for recipe
#				a. list frozen/not frozen items needed for recipe
#				b. list staple/not staple items needed for recipe
#				c. list items by all categories
#				d. list only items in given categories				
#		H. dump latest info to file
#		I. allow user to change to new data file  (This will save current data to the
#			old file, close the old file, open the new file, and finally load the data
#			from the new file.  All subsequent changes will be to the new file.)
#		J. allow user to gracefully exit program when finished
#	6. HIGH - Finish converting unit tests to rspec tests.  This item is nearly complete. 
#				Only filename and recipe tests remain, to catch up with current code.
#	7. HIGH - Add a README.txt.
#	8. Add --help and -h to user interface.

# Kitchen is a place that will have Recipes and ingredients.  
# Kitchen needs a file to store it's data.
class Kitchen
	attr_reader :pantry_path, :recipe_book_path
	def initialize(pantry_path=PANTRY_PATH_DEFAULT, recipe_book_path=RECIPE_BOOK_PATH_DEFAULT)
		@pantry_path = pantry_path
		@recipe_book_path = recipe_book_path
	end
end

class Recipe < Kitchen
	attr_reader :name
	def initialize(name, ingredients=INGREDIENTS_DEFAULT, directions=DIRECTIONS_DEFAULT)
		@name = name
		@ingredients = ingredients
		@directions = directions
	end

	def whatIngredients
		return @ingredients
	end

	def whatDirections
		return @directions
	end
end

class PantryItem < Kitchen

	attr_reader :name
	def initialize(name, category=CATEGORY_DEFAULT, freezer=IS_FROZEN_DEFAULT, staple=IS_STAPLE_DEFAULT)
		@name = name

		@category = category   # dairy, meat, produce, (which section of grocery store)
		@freezer = freezer   # stored in the freezer and needs to be thawed, adds prep time
		@staple = staple   # usually in stock, like spices, flour, sugar, milk, etc
	end

	def whichCategory
		return @category
	end

	def isFrozen
		return @freezer
	end

	def isStaple
		return @staple
	end

end


