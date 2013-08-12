### ui.rb
require './config'
require './kitchen'
require './recipe'
require './pantry_item'
require 'yaml'

###
# BEGIN UI
###

user_kitchen = Kitchen.new

if DEBUG
	puts
	puts
	puts "...loading pantry from:   #{user_kitchen.pantry_path}"
end

user_kitchen.loadPantryFromFile

if DEBUG
	user_kitchen.displayPantry

	puts
	puts
	puts
	puts "...loading recipes from:   #{user_kitchen.recipe_book_path}"
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
	ingredients = []
	i = count = d = 0
	puts message
	message = ""
	choice = ""
	puts("Please enter your two character command.")
	choice = gets.chomp

	case choice.upcase

	when "AR"
		puts "What is the name of your recipe?"
		recipeName = gets.chomp
		if recipeName == ""
			puts "A recipe needs a name.  Try again."
			puts "What is the name of your recipe?"
			recipeName = gets.chomp
		else
			puts "nice name"
		end
		
		puts "List your ingredients.  An empty line will signal that you have "
		puts "listed all the ingredients in the recipe."
		while i != "" do
			count = count + 1
			puts "ingredient ##{count}, (include amount):"
			i = gets.chomp

			if i.empty?
				puts "No more ingredients."
			else
				ingredients.push i
			end
		end

		puts "Enter your directions.  Whitespace and extra carriage returns are fine.  "
		puts "Just press Ctrl + D when you are done."
		directions = STDIN.read

		if recipeName == ""
			message = "Still no recipe name?  Ok, never mind."
		else
			recipe = Recipe.new(recipeName, ingredients, directions)
			user_kitchen.addToRecipeBook(recipe)	
			puts "Recipe successfully added to book."
		end
		puts

	when "CR"
		puts "TODO - You have chosen CR"
		puts

	when "PR"
		puts "Which recipe would you like to print?  Enter the name of the recipe, "
		puts "or ALL to print all of the recipes in your book"
		puts "or NAMES to print just the names of all the recipes in your book."
		recipeName = gets.chomp
		if recipeName == ""
			puts "No recipe chosen.  None printed."
		elsif recipeName.upcase == "ALL"
			puts "PRINTING ALL RECIPES..."
			user_kitchen.displayRecipeBook
		elsif recipeName.upcase == "NAMES"
			puts "PRINTING ALL RECIPE NAMES..."
			user_kitchen.displayRecipeBook
			user_kitchen.displayRecipeNames
		else
			puts "PRINTING RECIPE #{recipeName}..."
			user_kitchen.displayRecipe(recipeName)
		end

	when "DR"
		puts "Which recipe would you like to delete?  Enter the name of the recipe."
		recipeName = gets.chomp
		if recipeName == ""
			puts "No recipe chosen.  None deleted."
		else
			puts "DELETING RECIPE #{recipeName}..."
			recipe = user_kitchen.whichRecipe(recipeName)
			user_kitchen.deleteFromRecipeBook(recipe)
		end

	when "AP"
		puts "What is the name of your pantry item?"
		pantryItemName = gets.chomp
		if pantryItemName == ""
			puts "A pantry item needs a name.  Try again."
			puts "What is the name of your pantry item?"
			pantryItemName = gets.chomp
		else
			puts "nice name"
		end

		puts "Is this pantry item stored in the freezer, true or false?"
		frozen = gets.chomp
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
		end

	when "CP"
		puts "TODO - You have chosen CP"

	when "PP"
		user_kitchen.displayPantry

	when "DP"
		puts "Which pantry item would you like to delete?  Enter the name of the item."
		pantryItemName = gets.chomp
		if pantryItemName == ""
			puts "No pantry item chosen.  None deleted."
		else
			puts "DELETING PANTRY ITEM #{pantryItemName}..."
			pantryItem = user_kitchen.whichPantryItem(pantryItemName)
			user_kitchen.deleteFromPantry(pantryItem)
		end

	when "SP"
		puts "TODO - You have chosen SP"

	when "SR"
		puts "TODO - You have chosen SR"

	when "LP"
		puts "TODO - You have chosen LP"

	when "LR"
		puts "TODO - You have chosen LR"

	when "PF"
		puts "TODO - You have chosen PF"

	when "RF"
		puts "TODO - You have chosen RF"

	when "PC"
		puts KITCHEN

	when "NO"
		puts "THIS IS AN INTENTIONAL NO-OP FOR THE PURPOSES OF DEV/TESTING"

	when "QQ"
		quit = TRUE

	when ""
		puts "You have entered an empty string.  I must assume that means you wish to exit the program."
		quit = TRUE

	else
		error = "ERROR!  You have chosen: #{choice}.  That is not one of the available options, please try again.\n\n"
	end

	puts
end


