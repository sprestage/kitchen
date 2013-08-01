#!/usr/bin/env ruby
### kitchen.rb
require './config'

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
#	6. HIGH - Add a README.txt.

# Kitchen is a place that will have Recipes and PantryItems.  
class Kitchen
	attr_reader :pantry_path, :recipe_book_path
	def initialize(pantry_path=PANTRY_PATH_DEFAULT, recipe_book_path=RECIPE_BOOK_PATH_DEFAULT, 
									pantry=[], recipe_book=[])
		@pantry_path = pantry_path
		@recipe_book_path = recipe_book_path
		@pantry = pantry
		@recipe_book = recipe_book
	end

	def addToPantry
	end

	def displayPantry
		puts @pantry
	end

	def storePantryToFile
	end

	def loadPantryFromFile
	end

	def changeToDifferentPantryFile(new_pantry_path)
	end

	def addToRecipeBook(recipe)
		@recipe.each  do |r| 
			if r.name.downcase == recipe.name.downcase 
				puts ("This recipe, '#{recipe.name}', already exists in the recipe book.")
				return
			end
		end
		puts ("Adding recipe '#{recipe.name}'.")
		@recipe.push recipe
	end

	def deleteFromRecipeBook(recipe)
		@recipe.each do |r|
			if r == recipe
				puts ("Deleting recipe '#{recipe.name}'.")
				pantry.delete(r)
				return
			end
		end
	end

	def displayRecipeBook
		puts @recipe_book
	end

	def storeRecipeBookToFile
	end

	def loadRecipeBookFromFile
	end

	def changeToDifferentRecipeBook(new_recipe_book_path)
	end

end




