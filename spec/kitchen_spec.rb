### kitchen_spec.rb
require 'spec_helper'

describe Kitchen do
	before :all do
		FILE_NAME_PREFIX = "~/Documents/susan"
		PANTRY_PATH = "#{FILE_NAME_PREFIX}Pantry.txt"
		RECIPE_BOOK_PATH = "#{FILE_NAME_PREFIX}Recipes.txt"
	end

	before :each do
		@default_kitchen = Kitchen.new
		@non_default_kitchen = Kitchen.new("#{PANTRY_PATH}", "#{RECIPE_BOOK_PATH}")
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

	# describe "#addToPantry" do
	# 	it "" do
			
	# 	end
	# end



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

