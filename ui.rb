### ui.rb
require './config'
require './kitchen'
require './recipe'
require './pantry_item'
require 'yaml'

user_kitchen = Kitchen.new

if DEBUG
	puts
	puts
	puts "Loading pantry from:   #{user_kitchen.pantry_path}"
end

user_kitchen.loadPantryFromFile

if DEBUG
	user_kitchen.displayPantry

	puts
	puts
	puts
	puts "Loading recipes from:   #{user_kitchen.recipe_book_path}"
end

user_kitchen.loadRecipeBookFromFile

if DEBUG
	user_kitchen.displayRecipeBook
end

puts KITCHEN

quit = FALSE
error = message = ""
while quit == FALSE

	puts error
	choice = error = ""
	pantryItemName = frozen = staple = whichCategory = ""
	recipeName = directions = ""
	ingredients = recipe = []
	i = count = d = 0
	puts message
	message = ""
	choice = ""
	puts("Please enter your two character command.")
	choice = gets.chomp
	puts

	case choice.upcase

	when "AP"
		puts "What is the name of your pantry item?"
		pantryItemName = gets.chomp
		puts
		if pantryItemName == ""
			puts "A pantry item needs a name.  Try again."
			puts "What is the name of your pantry item?"
			pantryItemName = gets.chomp
			puts
		else
			puts "nice name"
		end

		puts "Is this pantry item stored in the freezer, true or false?"
		frozen = gets.chomp
		puts
		frozen = frozen.upcase
		if frozen == ""
			puts "Nothing entered.  Assuming item is not stored in the freezer."
			frozen = "FALSE"
		elsif frozen == "TRUE" || frozen == "FALSE"
			puts "freezer status set to #{frozen}."
		else
			puts "Invalid freezer status.  Setting to default, not stored in freezer."
			frozen = "FALSE"
		end

		puts "Is this pantry item a staple? (usually on hand "
		puts "and not requiring a grocery store run)?"
		staple = gets.chomp
		puts
		staple = staple.upcase
		if staple == ""
			puts "Nothing entered.  Assuming item is a staple."
			staple = "TRUE"
		elsif staple == "TRUE" || staple == "FALSE"
			puts "freezer status set to #{frozen}."
		else
			puts "Invalid staple status.  Setting to default, this item is a staple."
			staple = "TRUE"
		end

		puts "What is the category of your pantry item?"
		category = gets.chomp
		puts
		if category == ""
			puts "No category was entered.  Setting to default, no category."
		else
			puts "nice category"
		end

		if pantryItemName == ""
			message = "Still no pantry item name?  Ok, never mind."
		else
			pantryItem = PantryItem.new(pantryItemName, frozen, staple, category)
			user_kitchen.addToPantry(pantryItem)	
			puts "Item successfully added to pantry."
			user_kitchen.displayPantry
		end

	when "CP"
		puts "TODO - You have chosen CP"

	when "PP"
		user_kitchen.displayPantry

	when "DP"
		puts "Which pantry item would you like to delete?  Enter the name of the item."
		pantryItemName = gets.chomp
		puts
		if pantryItemName == ""
			puts "No pantry item chosen.  None deleted."
		else
			puts "DELETING PANTRY ITEM #{pantryItemName}"
			pantryItem = user_kitchen.getPantryItemByName(pantryItemName)
			user_kitchen.deleteFromPantry(pantryItem)
			user_kitchen.displayPantry
		end

	when "AR"
		puts "What is the name of your recipe?"
		recipeName = gets.chomp
		puts
		if recipeName == ""
			puts "A recipe needs a name.  Try again."
			puts "What is the name of your recipe?"
			recipeName = gets.chomp
			puts
		else
			puts "nice name"
		end
		
		puts "List your ingredients.  An empty line will signal that you have "
		puts "listed all the ingredients in the recipe."
		while i != "" do
			count = count + 1
			puts "ingredient ##{count}, (include amount):"
			i = gets.chomp
			puts
			if i.empty?
				if count == 1
					puts "A recipe needs ingredients.  Try again."
					puts "ingredient ##{count}, (include amount):"
					i = gets.chomp
					puts
					if i.length > 0
						ingredients.push i
					end
				else
					puts "No more ingredients."
				end
			else
				ingredients.push i
			end
		end

		puts "Enter your directions.  Whitespace and extra carriage returns are fine.  "
		puts "Just press Ctrl + D when you are done."
		directions = STDIN.read

		if recipeName == ""
			message = "Still no recipe name?  Ok, never mind."
		elsif ingredients == []
			message = "Still no ingredients?  Ok, never mind."
		else
			recipe = Recipe.new(recipeName, ingredients, directions)
			user_kitchen.addToRecipeBook(recipe)	
			puts "Recipe successfully added to book."
			user_kitchen.displayRecipeNames
			user_kitchen.displayRecipeByName(recipeName)
		end
		puts

	when "CR"
		puts "TODO - You have chosen CR"
		puts

	when "PR"
		puts "How would you like to view your receipes?"
		puts "    Enter the name of a single recipe to view, "
		puts "    or 'ALL' to print all of the recipes in your book"
		puts "    or 'NAMES' to print just the names of all the recipes in your book."
		recipeName = gets.chomp
		puts
		if recipeName == ""
			puts "No recipe chosen.  Printing all recipe namess."
			puts "PRINTING ALL RECIPE NAMES"
			user_kitchen.displayRecipeNames
		elsif recipeName.upcase == "ALL"
			puts "PRINTING ALL RECIPES"
			user_kitchen.displayRecipeBook
		elsif recipeName.upcase == "NAMES"
			puts "PRINTING ALL RECIPE NAMES"
			user_kitchen.displayRecipeNames
		else
			puts "PRINTING RECIPE #{recipeName}"
			user_kitchen.displayRecipeByName(recipeName)
		end

	when "DR"
		puts "Which recipe would you like to delete?  Enter the name of the recipe."
		recipeName = gets.chomp
		puts
		if recipeName == ""
			puts "No recipe chosen.  None deleted."
		else
			puts "DELETING RECIPE #{recipeName}"
			recipe = user_kitchen.getRecipeByName(recipeName)
			user_kitchen.deleteFromRecipeBook(recipe)
			user_kitchen.displayRecipeNames
		end

	when "SP"
		user_kitchen.storePantryToFile
		puts "PANTRY STORED TO #{user_kitchen.pantry_path}."

	when "SR"
		user_kitchen.storeRecipeBookToFile
		puts "RECIPES STORED TO #{user_kitchen.recipe_book_path}."

	when "LP"
		newPantryPath = ""
		puts "You are currently using #{user_kitchen.pantry_path}."
		puts
		puts "Changing to a new pantry file will save existing data to the current file."
		puts "Then will load up the data from the new pantry file.  Subsequent changes"
		puts "will be made to the new file."
		user_kitchen.storePantryToFile
		user_kitchen.deleteCurrentPantry
		puts
		puts "Where is the new pantry file you'd like to use (include path and filename)?"
		newPantryPath = gets.chomp
		puts
		user_kitchen.pantry_path = newPantryPath
		puts "You are now using #{user_kitchen.pantry_path}"
		user_kitchen.loadPantryFromFile
		user_kitchen.displayPantry

	when "LR"
		newRecipeBookPath = ""
		puts "You are currently using #{user_kitchen.recipe_book_path}."
		puts
		puts "Changing to a new recipe file will save existing data to the current file."
		puts "Then will load up the data from the new recipe file.  Subsequent changes"
		puts "will be made to the new file."
		user_kitchen.storeRecipeBookToFile
		user_kitchen.deleteCurrentRecipeBook
		puts
		puts "Where is the new recipe file you'd like to use (include path and filename)?"
		newRecipeBookPath = gets.chomp
		puts
		user_kitchen.recipe_book_path = newRecipeBookPath
		puts "You are now using #{user_kitchen.recipe_book_path}."
		user_kitchen.loadRecipeBookFromFile
		user_kitchen.displayRecipeBook

	when "PC"
		puts KITCHEN

	when "NO"
		puts "THIS IS AN INTENTIONAL NO-OP FOR THE PURPOSES OF DEV/TESTING"

	when "QQ"
		user_kitchen.storePantryToFile
		puts "PANTRY STORED TO #{user_kitchen.pantry_path}."
		user_kitchen.storeRecipeBookToFile
		puts "RECIPES STORED TO #{user_kitchen.recipe_book_path}."
		puts "exiting"
		quit = TRUE

	when ""
		puts "You have entered an empty string.  I must assume that means you wish to exit the program."
		user_kitchen.storePantryToFile
		puts "PANTRY STORED TO #{user_kitchen.pantry_path}."
		user_kitchen.storeRecipeBookToFile
		puts "RECIPES STORED TO #{user_kitchen.recipe_book_path}."
		puts "exiting"
		quit = TRUE

	else
		error = "ERROR!  You have chosen: #{choice}.  That is not one of the available options, please try again.\n\n"
	end

	puts
end


