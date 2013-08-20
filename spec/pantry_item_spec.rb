### pantry_item_spec.rb 
require 'spec_helper'

describe PantryItem do
	before :each do
		@default_pantry_item = PantryItem.new("default pantry item")
		@non_default_pantry_item = PantryItem.new("non default pantry item", IS_FROZEN_NON_DEFAULT, 
													IS_STAPLE_NON_DEFAULT, CATEGORY_NON_DEFAULT)
		@pantry_item = PantryItem.new("pantry item")
	end

	subject { @default_pantry_item }

	it { should respond_to(:name) }

	describe "#new" do
    	it "takes one parameter and returns a PantryItem object" do
        	@default_pantry_item.should be_an_instance_of PantryItem
    	end
	end

	describe "#new" do
    	it "takes all four parameters and returns a PantryItem object" do
        	@non_default_pantry_item.should be_an_instance_of PantryItem
    	end
	end

	describe "#isFrozen" do
		it "default should be FALSE" do
			@default_pantry_item.isFrozen.should eq(IS_FROZEN_DEFAULT)
		end
	end

	describe "#isFrozen" do
		it "non-default value can be TRUE" do
			@non_default_pantry_item.isFrozen.should eq(IS_FROZEN_NON_DEFAULT)
		end
	end

	describe "#isStaple" do
		it "default should be TRUE" do
			@default_pantry_item.isStaple.should eq(IS_STAPLE_DEFAULT)
		end
	end

	describe "#isStaple" do
		it "non-default value can be FALSE" do
			@non_default_pantry_item.isStaple.should eq(IS_STAPLE_NON_DEFAULT)
		end
	end

	describe "#category" do
		it "default should be an empty string" do
			@default_pantry_item.category.should eq(CATEGORY_DEFAULT)
		end
	end

	describe "#category" do
		it "category is a string" do
			@default_pantry_item.category.is_a?(String).should eq(TRUE)
		end
	end

	describe "#category" do
		it "non-default string can be set" do
			@non_default_pantry_item.category.should eq(CATEGORY_NON_DEFAULT)
		end
	end


### TODO Uncomment these when user inputted PantryItems is implemented.
	# describe "#new" do
	# 	before { @pantry_item.name = "" }
	# 	it "name cannot be empty string" do
	# 		@pantry_item.name.should_not eq ("")
	# 	end
	# end

	# describe "#new" do
	# 	before { @pantry_item.name = "a" * 51 }
	# 	it "when name is too long" do
	# 		@pantry_item.name.length.should_not eq(51)
	# 	end
	# end

	# describe "#new" do
	# 	before do
	# 		@pantry_item.name = "pantry item"
	# 		@dup_pantry_item = PantryItem.new("pantry item")
	# 	end
	# 	it "name must be unique" do
	# 		@dup_pantry_item.name.should_not eq(@pantry_item.name)
	# 	end
	# end

	# describe "#new" do
	# 	before { @pantry_item.name = "PaNTrY iTeM" }
	# 	it "names will be downcased" do
	# 		pantry_item.name.should_not eq("PaNTrY iTeM")
	# 	end
	# end
###

end


