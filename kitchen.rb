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
#		I. allow user to change to new data file for both recipe_book and pantry  (This 
#			will save current data to the old file, close the old file, open the new file, 
#			and finally load the data from the new file.  All subsequent changes will be 
#			to the new file.)
#		J. allow user to gracefully exit program when finished
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
			file.puts ("#{p.name}")
			file.puts ("#{p.isFrozen}")
			file.puts ("#{p.isStaple}")
			file.puts ("#{p.whichCategory}")
		end
		file.close unless file == nil
		return TRUE
	end

	def loadPantryFromFile
		File.open("#{@pantry_path}", "r") do |f|
			count = 0
			name = ""
			freezer = ""
			staple = ""
			category = ""
			f.each_line do |line|
				line = line.gsub(/\n/," ")
				count = count + 1
				if count == 1
					name = line
				elsif count == 2
					freezer = line
				elsif count == 3
					staple = line
				else
					category = line
					a_pantry_item = PantryItem.new(name, freezer, staple, category)
					@pantry.push a_pantry_item
					count = 0
				end
			end
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

	def storeRecipeBookToFile
		file = File.open(@recipe_book_path, "w")
		if file == nil
			return FALSE
		else
			@recipe_book.each do |r|
				file.puts ("#{r.name}")
				file.puts ("#{r.whatIngredients}")
				file.puts ("#{r.whatDirections}")
			end
			file.close unless file == nil
			return TRUE
		end
	end

	def loadRecipeBookFromFile
		if @recipe_book_path.length == 0
			return FALSE
		else
			File.open("#{@recipe_book_path}", "r") do |f|
				count = 0
				name = ""
				ingredients = []
				directions = ""
				f.each_line do |line|
					count = count + 1
					if count == 1
						name = line
					elsif count == 2
						line.gsub!(/(\,)(\S)/, "\\1 \\2")
						ingredients = YAML::load(line)
					else
						directions = line
						a_recipe = Recipe.new(name, ingredients, directions)
						@recipe_book.push a_recipe
						count = 0
					end
				end
				return TRUE
			end
		end		
	end
end

