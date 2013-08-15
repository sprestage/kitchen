#!/usr/bin/env ruby
### kitchen.rb
require './config'
require 'table_print'

#TODO - FEATURES
#	1. Set up user interface:
#		A. change recipe
#		B. list recipes in kitchen
#			i. DONE - list all recipes, long version
#			ii. DONE - list all recipes, only by name
#			iii. list just recipes fitting parameters?  This should probably move to NICE TO HAVE.
#		C. change pantry item
#
# TODO - NICE TO HAVE FEATURES (for later implementation consideration)
#	1. Add inStock to PantryItems
#	2. Add a glutenFree and dairyFree to Recipes and PantryItems, or perhaps 
#		just a aaronSafe bit for both.
#	3. List pantry items by category, frozen, staple
#	4. List pantry items needed for recipe
#		A. list frozen/not frozen items needed for recipe
#		B. list staple/not staple items needed for recipe
#		C. list items by all categories
#		D. list only items in given categories	
#	5.	List recipes that fit certain parameters (like GF, dairy free, etc)			


# Kitchen is a place that will have Recipes and PantryItems.  
class Kitchen
	attr_accessor :pantry_path, :recipe_book_path
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

	def getPantryItemByName(pantry_item_name)
		@pantry.each do |p|
			if p.name.downcase == pantry_item_name.downcase
				return p
			end
		end
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

	def deleteCurrentPantry
		@pantry = []
	end

	def displayPantry
		if DEBUG
			puts
			puts "\t======================================================"
			puts "\t\t\t    #{@kitchen_name} Pantry"
			puts "\t======================================================"
			puts
			puts
			tp @pantry, :name, {:frozen => {:display_method => :isFrozen}}, {:staple => {:display_method => :isStaple}}, {:category => {:display_method => :whichCategory}}
		end
		return TRUE
	end

	def storePantryToFile
		file = File.new(@pantry_path, "w")
		@pantry.each do |p|
			file.puts "#{p.name}"
			file.puts "#{p.isFrozen}"
			file.puts "#{p.isStaple}"
			file.puts "#{p.whichCategory}"
		end
		file.close unless file == nil
		return TRUE
	end

	def loadPantryFromFile
		if @pantry_path.length == 0
			return FALSE
		else
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
		end
	end

	def changeToDifferentPantryFile(new_pantry_path)
		@pantry_path = new_pantry_path
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

	def getRecipeByName(recipe_name)
		@recipe_book.each do |r|
			if r.name.downcase == recipe_name.downcase
				return r
			end
		end
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

	def deleteCurrentRecipeBook
		@recipe_book = []
	end

	def displayRecipeByName(recipe_name)
		@recipe_book.each do |r|
			name = r.name
			name = name.gsub(/\n/,"")
			if name.downcase == recipe_name.downcase
				if DEBUG
					puts "#{r.name}"
					puts
					ingredients_list = r.whatIngredients
					ingredients_list.each do |i|
						puts "\t#{i}"
					end
					puts
					puts r.whatDirections.split( /(.{,100}\S)\s+/ ).reject( &:empty? )
					puts
					puts
				end
			end
		end
	end

	def displayRecipe(recipe)
		@recipe_book.each do |r|
			if r == recipe
				if DEBUG
					puts "#{r.name}"
					puts
					ingredients_list = r.whatIngredients
					ingredients_list.each do |i|
						puts "\t#{i}"
					end
					puts
					puts r.whatDirections.split( /(.{,100}\S)\s+/ ).reject( &:empty? )
					puts
					puts
				end
			end
		end
	end

	def displayRecipeBook
		puts
		puts "\t======================"
		puts "\t    #{@kitchen_name} Recipes"
		puts "\t======================"
		puts
		puts
		@recipe_book.each do |r|
			displayRecipe(r)
		end
		return TRUE
	end

	def displayRecipeNames
		if DEBUG
			puts
			puts "======================"
			puts
		end
		@recipe_book.each do |r|
			if DEBUG
				puts "#{r.name}"
			end
		end
		if DEBUG
			puts
			puts "======================"
		end
		return TRUE
	end

	def storeRecipeBookToFile
		file = File.new(@recipe_book_path, "w")
		if file == nil
			return FALSE
		else
			@recipe_book.each do |r|
				file.puts "_RECIPE_#{r.name}"
				file.puts "#{r.whatIngredients}"
				file.puts "#{r.whatDirections}"
			end
			file.close unless file == nil
			return TRUE
		end
	end

	def loadRecipeBookFromFile
		if @recipe_book_path.length == 0
			puts "FAILED TO LOAD RECIPE BOOK FROM: #{@recipe_book_path}"
			return FALSE
		else
			File.open("#{@recipe_book_path}", "r") do |f|
				count = 0
				name = ""
				ingredients = []
				directions = ""
				f.each_line do |line|
					if line.include? "_RECIPE_"
						###   Clean up from those multi-line directions 
						###   from the last recipe loaded.
						if directions.length > 0
							a_recipe = Recipe.new(name, ingredients, directions)
							@recipe_book.push a_recipe
							ingredients = []
							directions = ""
						end
						name = line.gsub("_RECIPE_", "")
					elsif directions.empty? && ingredients == []
						line.gsub!(/(\,)(\S)/, "\\1 \\2")
						ingredients = YAML::load(line)
					else
						directions = directions + line
					end
				end
				if directions.length > 0
					a_recipe = Recipe.new(name, ingredients, directions)
					@recipe_book.push a_recipe
					directions = ""
				end
				return TRUE
			end
		end		
	end

	def changeToDifferentRecipeBookFile(new_recipe_book_path)
		@recipe_book_path = new_recipe_book_path
	end
end




