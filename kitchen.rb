#!/usr/bin/env ruby
### kitchen.rb
require './config'

#TODO - FEATURES
#	1. Load kitchen data from given file, warn if file not present or is empty.
#	2. Set up user interface:
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
#	3. HIGH - Add a README.txt.
#
# TODO - NICE TO HAVE FEATURES (for later implementation consideration)
# 1. Perhaps an inStock addition to PantryItems

# Kitchen is a place that will have Recipes and PantryItems.  
class Kitchen
	attr_reader :pantry_path, :recipe_book_path
	def initialize(kitchen_name=KITCHEN_NAME_DEFAULT, pantry_path=PANTRY_PATH_DEFAULT, 
									recipe_book_path=RECIPE_BOOK_PATH_DEFAULT, pantry=[], recipe_book=[])
		@kitchen_name = kitchen_name
		@pantry_path = pantry_path
		@recipe_book_path = recipe_book_path
		@pantry = pantry
		@recipe_book = recipe_book
	end

	def addToPantry(pantry_item)
		@pantry.each do |p|
			if p.name.downcase == pantry_item.name.downcase
				return FALSE
			end
		end
		@pantry.push pantry_item
		return TRUE
	end

	def deleteFromPantry(pantry_item)
		@pantry.each do |p|
			if p == pantry_item
				@pantry.delete(pantry_item)
				return TRUE
			end
		end
		puts ("Cannot delete '#{pantry_item}'.")
		return FALSE
	end

	def displayPantry
		puts
		puts ("\t============================")
		puts ("\t\t#{@kitchen_name} Pantry")
		puts ("\t============================")
		puts
		puts ("Pantry Item Name\t\tFrozen?\t\tStaple?\t\tCategory")
		puts
		@pantry.each do |p|
			print ("#{p.name}\t\t#{p.isFrozen}\t\t#{p.isStaple}\t\t#{p.whichCategory}\n")
		end
		puts
		return TRUE
	end

	def storePantryToFile
			file = File.open(@pantry_path, "w")
			@pantry.each do |p|
				file.puts ("#{p.name}\t#{p.isFrozen}\t#{p.isStaple}\t#{p.whichCategory}")
			end
			file.close unless file == nil
			return TRUE
	end

	def loadPantryFromFile
		File.open("#{@pantry_path}", "r") do |f|
			f.each_line do |line|
				puts line
			end
# TODO need to parse 'line' and store it properly, line by line, into @pantry
			return TRUE
		end
		return FALSE
	end

	def changeToDifferentPantryFile(new_pantry_path)
	end

	def addToRecipeBook(recipe)
		@recipe_book.each  do |r| 
			if r.name.downcase == recipe.name.downcase 
				return FALSE
			end
		end
		@recipe_book.push recipe
		return TRUE
	end

	def deleteFromRecipeBook(recipe)
		@recipe_book.each do |r|
			if r == recipe
				@recipe_book.delete(recipe)
				return TRUE
			end
		end
		puts ("Cannot delete '#{recipe.name}'.")
		return FALSE
	end

	def displayRecipeBook
		puts
		puts ("======================")
		puts ("#{@kitchen_name} Recipes")
		puts ("======================")
		puts
		@recipe_book.each do |r|
			puts ("Recipe: \t\t#{r.name}")
			puts ("Ingredients: ")
			ingredients_list = r.whatIngredients
			ingredients_list.each do |i|
				print ("\t\t\t#{i}\n")
			end
			puts ("Directions: ")
			puts ("\t\t\t#{r.whatDirections}")
			puts
		end
		puts
		return TRUE
	end

###
	def storeRecipeBookToFile
		file = File.open(@recipe_book_path, "w")
		@recipe_book.each do |r|
#TODO QUESTION need break down ingredients? or leave it in it's own array?
			file.puts ("#{r.name}\t#{r.whatIngredients}\t#{r.whatDirections}")
		end
		file.close unless file == nil
		return TRUE
	end

	def loadRecipeBookFromFile
		File.open("#{@recipe_book_path}", "r") do |f|
			f.each_line do |line|
				puts line
			end
# TODO need to parse 'line' and store it properly, line by line, into @recipe_book
			return TRUE
		end
		return FALSE
	end
###

	def changeToDifferentRecipeBook(new_recipe_book_path)
	end

end




