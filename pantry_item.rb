#!/usr/bin/env ruby
### pantry_item.rb
require './config'

class PantryItem

	attr_reader :name
	def initialize(name, freezer=IS_FROZEN_DEFAULT, staple=IS_STAPLE_DEFAULT, category=CATEGORY_DEFAULT)
		@name = name
		@freezer = freezer   # stored in the freezer and needs to be thawed, adds prep time
		@staple = staple   # usually in stock, like spices, flour, sugar, milk, etc
		@category = category   # dairy, meat, produce, (which section of grocery store)
	end

	def isFrozen
		return @freezer
	end

	def isStaple
		return @staple
	end

	def whichCategory
		return @category
	end

end
