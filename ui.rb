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
	puts ("...loading pantry from:   #{user_kitchen.pantry_path}")
end

user_kitchen.loadPantryFromFile

if DEBUG
	user_kitchen.displayPantry

	puts
	puts
	puts
	puts ("...loading recipes from:   #{user_kitchen.recipe_book_path}")
end

user_kitchen.loadRecipeBookFromFile

if DEBUG
	user_kitchen.displayRecipeBook
end

quit = FALSE
error = ""
while quit == FALSE

	puts
	puts
	puts
	puts("||=================================================================||")
	puts("||                          #{KITCHEN_NAME_DEFAULT.upcase}")
	puts("||                          KITCHEN                                ||")
	puts("||=================================================================||")
	puts("||                                                                 ||")
	puts("||      Welcome to your Kitchen Manager.  In your Kitchen you      ||")
	puts("||      have a Pantry, where you keep all your ingredients.        ||")
	puts("||      You also have a Recipe Book where you keep all your        ||")
	puts("||      recipes.     -sprestage                                    ||")
	puts("||                                                                 ||")
	puts("||=================================================================||")
	puts("||                         COMMANDS                                ||")
	puts("||                                                                 ||")
	puts("||          AR - Add Recipe                                        ||")
	puts("||          CR - Change Recipe                                     ||")
	puts("||          PR - Print Recipes                                     ||")
	puts("||          DR - Delete Recipe                                     ||")
	puts("||                                                                 ||")
	puts("||          AP - Add item to Pantry                                ||")
	puts("||          CP - Change item in the Pantry                         ||")
	puts("||          PP - Print the Pantry                                  ||")
	puts("||          DP - Delete item in Pantry                             ||")
	puts("||                                                                 ||")
	puts("||          SP - Save Pantry to file                               ||")
	puts("||          SR - Save Recipes to file                              ||")
	puts("||          LP - Load Pantry from File (this will also save        ||")
	puts("||                 existing recipes to current Pantry File)        ||")
	puts("||          LR - Load Recipes from File (this will also save       ||")
	puts("||                 existing recipes to current Recipe File)        ||")
	puts("||          PF - Change to different Pantry File                   ||")
	puts("||          RF - Change to different Recipe File                   ||")
	puts("||                                                                 ||")
	puts("||          QQ - Quit program.  This will save the Pantry and      ||")
	puts("||                 the Recipes to file.                            ||")
	puts("||                                                                 ||")
	puts("||=================================================================||")
	puts

	puts error
	choice = error = recipeName = directions = ""
	ingredients = []
	i = count = d = 0
	puts("Please enter your two character command.")
	choice = gets.chomp

	case choice.upcase

	when "AR"
		puts "You have chosen AR"

		puts "What is the name of your recipe?"
		recipeName = gets.chomp
		
		puts "List your ingredients.  An empty line will signal that you have "
		puts "listed all the ingredients in the recipe."
		while i != "" do
			count = count + 1
			puts ("ingredient ##{count}, (include amount):")
			i = gets.chomp

			if i.empty?
				puts "No more ingredients."
			else
				ingredients.push i
			end
		end

		puts ("Enter your directions.  Whitespace and extra carriage returns are fine.  ")
		puts ("Just type END (all caps) and then <return> when you are done.")
		$/ = "END"
		directions = STDIN.gets

		if directions.include? "END"
			puts ("End of directions.")
			puts
		end
		directions = directions.gsub("END", "")

		recipe = Recipe.new(recipeName, ingredients, directions)
		user_kitchen.addToRecipeBook(recipe)	

	when "CR"
		puts "You have chosen CR"

	when "PR"
		puts "You have chosen PR"
		user_kitchen.displayRecipeBook

	when "DR"
		puts "You have chosen DR"

	when "AP"
		puts "You have chosen AP"

	when "CP"
		puts "You have chosen CP"

	when "PP"
		puts "You have chosen PP"
		user_kitchen.displayPantry

	when "DP"
		puts "You have chosen DP"

	when "SP"
		puts "You have chosen SP"

	when "SR"
		puts "You have chosen SR"

	when "LP"
		puts "You have chosen LP"

	when "LR"
		puts "You have chosen LR"

	when "PF"
		puts "You have chosen PF"

	when "RF"
		puts "You have chosen RF"

	when "QQ"
		puts "You have chosen QQ"
		quit = TRUE

	when ""
		puts "You have entered an empty string.  I must assume that means you wish to exit the program."
		quit = TRUE

	else
		error = "ERROR!  You have chosen: #{choice}.  That is not one of the available options, please try again.\n\n"
	end

	puts
end


