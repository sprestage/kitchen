#!/usr/bin/env ruby
### recipe.rb
require './kitchen'

class PantryItem < Kitchen

	attr_reader :name
	def initialize(name, category=CATEGORY_DEFAULT, freezer=IS_FROZEN_DEFAULT, staple=IS_STAPLE_DEFAULT)
		@name = name

		@category = category   # dairy, meat, produce, (which section of grocery store)
		@freezer = freezer   # stored in the freezer and needs to be thawed, adds prep time
		@staple = staple   # usually in stock, like spices, flour, sugar, milk, etc
	end

	def whichCategory
		return @category
	end

	def isFrozen
		return @freezer
	end

	def isStaple
		return @staple
	end

end
