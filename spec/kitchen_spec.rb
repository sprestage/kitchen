### kitchen_spec.rb
require 'spec_helper'

describe Kitchen do
	before :each do
		@default_kitchen = Kitchen.new
		@non_default_kitchen = Kitchen.new("#{PANTRY_PATH}", "#{RECIPE_BOOK_PATH}")
		@default_recipe = Recipe.new("default recipe")
		@non_default_recipe = Recipe.new("Non Default Recipe", INGREDIENTS_NON_DEFAULT, 
											DIRECTIONS_NON_DEFAULT)
		@default_pantry_item = PantryItem.new("default pantry item")
		@non_default_pantry_item = PantryItem.new("non default pantry item", !IS_FROZEN_DEFAULT, 
													!IS_STAPLE_DEFAULT, CATEGORY_NON_DEFAULT)
	end
	subject { @default_kitchen }

	it { should respond_to(:pantry_path) }
	it { should respond_to(:recipe_book_path) }

	describe "#new" do
    	it "takes one parameter and returns a Kitchen object" do
        	@default_kitchen.should be_an_instance_of Kitchen
    	end
	end

	describe "#new" do
    	it "takes all three parameters and returns a Kitchen object" do
        	@non_default_kitchen.should be_an_instance_of Kitchen
    	end
	end

	describe "#pantry_path" do
		it "default sets to DEFAULT_PANTRY_PATH" do
			@default_kitchen.pantry_path.should eq(PANTRY_PATH_DEFAULT)
		end
	end

	describe "#pantry_path" do
		it "non-default string can be set" do
			@non_default_kitchen.pantry_path.should_not eq(PANTRY_PATH_DEFAULT)
		end
	end

	describe "#recipe_book_path" do
		it "default sets to DEFAULT_RECIPE_BOOK_PATH" do
			@default_kitchen.recipe_book_path.should eq(RECIPE_BOOK_PATH_DEFAULT)
		end
	end

	describe "#recipe_book_path" do
		it "non-default string can be set" do
			@non_default_kitchen.recipe_book_path.should_not eq(RECIPE_BOOK_PATH_DEFAULT)
		end
	end

	describe "#addToPantry" do
		it "successful add default pantry item to pantry" do
			@default_kitchen.addToPantry(@default_pantry_item).should eq(TRUE)
		end
	end

	describe "#addToPantry" do
		it "successful add non-default pantry item to pantry" do
			@default_kitchen.addToPantry(@non_default_pantry_item).should eq(TRUE)
		end
	end

	describe "#addToPantry" do
		it "adding duplicate to pantry will fail" do
			@default_kitchen.addToPantry(@default_pantry_item)
			@default_kitchen.addToPantry(@default_pantry_item).should_not eq(TRUE)
		end
	end

	describe "#deleteFromPantry" do
		it "successful delete default pantry item from pantry" do
			@default_kitchen.addToPantry(@default_pantry_item)
			@default_kitchen.deleteFromPantry(@default_pantry_item).should eq(TRUE)
		end
	end

	describe "#deleteFromPantry" do
		it "successful delete non-default pantry item from pantry" do
			@default_kitchen.addToPantry(@non_default_pantry_item)
			@default_kitchen.deleteFromPantry(@non_default_pantry_item).should eq(TRUE)
		end
	end

	describe "#deleteFromPantry" do
		it "cannot delete same pantry item twice from pantry" do
			@default_kitchen.addToPantry(@default_pantry_item)
			@default_kitchen.deleteFromPantry(@default_pantry_item)
			@default_kitchen.deleteFromPantry(@default_pantry_item).should_not eq(TRUE)
		end
	end

	describe "#displayPantry" do
		it "displays entire pantry (default pantry item)" do
			@default_kitchen.addToPantry(@default_pantry_item)
			@default_kitchen.displayPantry.should eq(TRUE)
		end
	end

	describe "#displayPantry" do
		it "displays entire pantry (non-default pantry item)" do
			@default_kitchen.addToPantry(@non_default_pantry_item)
			@default_kitchen.displayPantry.should eq(TRUE)
		end
	end

	describe "#displayPantry" do
		it "displays empty pantry" do
			@default_kitchen.displayPantry.should eq(TRUE)
		end
	end

	describe "#addToRecipeBook" do
		it "successful add (default recipe) to recipe book" do
			@default_kitchen.addToRecipeBook(@default_recipe).should eq(TRUE)
		end
	end

	describe "#addToRecipeBook" do
		it "successful add (non-default recipe) to recipe book" do
			@default_kitchen.addToRecipeBook(@non_default_recipe).should eq(TRUE)
		end
	end

	describe "#addToRecipeBook" do
		it "adding duplicate to recipe book will fail" do
			@default_kitchen.addToRecipeBook(@default_recipe)
			@default_kitchen.addToRecipeBook(@default_recipe).should_not eq(TRUE)
		end
	end

	describe "#deleteFromRecipeBook" do
		it "successful delete (default recipe) from recipe book" do
			@default_kitchen.addToRecipeBook(@default_recipe)
			@default_kitchen.deleteFromRecipeBook(@default_recipe).should eq(TRUE)
		end
	end

	describe "#deleteFromRecipeBook" do
		it "successful delete (non-default recipe) from recipe book" do
			@default_kitchen.addToRecipeBook(@non_default_recipe)
			@default_kitchen.deleteFromRecipeBook(@non_default_recipe).should eq(TRUE)
		end
	end

	describe "#deleteFromRecipeBook" do
		it "cannot delete same recipe twice from recipe book" do
			@default_kitchen.addToRecipeBook(@default_recipe)
			@default_kitchen.deleteFromRecipeBook(@default_recipe)
			@default_kitchen.deleteFromRecipeBook(@default_recipe).should_not eq(TRUE)
		end
	end

	describe "#displayRecipeBook" do
		it "displays entire recipe book (default recipe)" do
			@default_kitchen.addToRecipeBook(@default_recipe)
			@default_kitchen.displayRecipeBook.should eq(TRUE)
		end
	end

	describe "#displayRecipeBook" do
		it "displays entire recipe book (non-default recipe)" do
			@default_kitchen.addToRecipeBook(@non_default_recipe)
			@default_kitchen.displayRecipeBook.should eq(TRUE)
		end
	end

	describe "#displayRecipeBook" do
		it "displays empty recipe book" do
			puts "Display empty recipe book."
			@default_kitchen.displayRecipeBook.should eq(TRUE)
		end
	end



### TODO add a regex validator for the user inputted filename.  Probably looking like:
	#	VALID_FILENAME_REGEX = /\A[a-z\d]+\z/i
	#		the above reg ex should translate to:
	#			/			start of regex
	#			\A 			match start of a string
	#			[a-z\d]+	at least one letter or digit
	#			\z 			match end of a string
	#			/ 			end of regex
	#			i 			case insensitive
###

end
