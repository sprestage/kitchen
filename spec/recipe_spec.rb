### recipe_spec.rb 
require 'spec_helper'

describe Recipe do
	before :all do
		INGREDIENTS_NON_DEFAULT = ["ingred_one","ingred_two","ingred_three"]
		DIRECTIONS_NON_DEFAULT = "Lengthy directions."
	end

	before :each do
		@default_recipe = Recipe.new("Default Recipe")
		@non_default_recipe = Recipe.new("Non Default Recipe", 
																				INGREDIENTS_NON_DEFAULT, DIRECTIONS_NON_DEFAULT)
		@recipe = Recipe.new("My Recipe")
	end

	subject { @default_recipe }

	it { should respond_to(:name) }

	describe "#new" do
    	it "takes one parameter and returns a Recipe object" do
        	@default_recipe.should be_an_instance_of Recipe
    	end
	end

	describe "#new" do
    	it "takes all three parameters and returns a Recipe object" do
        	@non_default_recipe.should be_an_instance_of Recipe
    	end
	end

	describe "#whatIngredients" do
		it "default should be an empty string" do
			@default_recipe.whatIngredients.should eq(INGREDIENTS_DEFAULT)
		end
	end

	describe "#whatIngredients" do
		it "ingredients is a string" do
			@default_recipe.whatIngredients.is_a?(Array).should eq(TRUE)
		end
	end

	describe "#whatIngredients" do
		it "non-default string can be set" do
			@non_default_recipe.whatIngredients.should eq(INGREDIENTS_NON_DEFAULT)
		end
	end

	describe "#whatDirections" do
		it "default should be FALSE" do
			@default_recipe.whatDirections.should eq(DIRECTIONS_DEFAULT)
		end
	end

	describe "#whatDirections" do
		it "directions is a string" do
			@default_recipe.whatDirections.is_a?(String).should eq(TRUE)
		end
	end

	describe "#whatDirections" do
		it "non-default value can be TRUE" do
			@non_default_recipe.whatDirections.should eq(DIRECTIONS_NON_DEFAULT)
		end
	end

### TODO Uncomment these when user inputted Recipes is implemented.
	# describe "#new" do
	# 	before { @recipe.name = "" }
	# 	it "name cannot be empty string" do
	# 		@recipe.name.should_not eq ("")
	# 	end
	# end

	# describe "#new" do
	# 	before { @recipe.name = "a" * 51 }
	# 	it "when name is too long" do
	# 		@recipe.name.length.should_not eq(51)
	# 	end
	# end

	# describe "#new" do
	# 	before do
	# 		@recipe.name = "My Recipe"
	# 		@dup_recipe = Recipe.new("My Recipe")
	# 	end
	# 	it "name must be unique" do
	# 		@dup_recipe.name.should_not eq(@recipe.name)
	# 	end
	# end

	# describe "#new" do
	# 	before { @recipe.name = "rEcIpE" }
	# 	it "names will be downcased" do
	# 		@recipe.name.should_not eq("rEcIpE")
	# 	end
	# end
###

end


