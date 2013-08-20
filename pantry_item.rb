#!/usr/bin/env ruby
### pantry_item.rb
require './config'

class PantryItem

	attr_accessor :name, :isFrozen, :isStaple, :category
	def initialize(name, isFrozen=IS_FROZEN_DEFAULT, isStaple=IS_STAPLE_DEFAULT, category=CATEGORY_DEFAULT)
		@name = name
		@isFrozen = isFrozen   # stored in the freezer and needs to be thawed, adds prep time
		@isStaple = isStaple   # usually in stock, like spices, flour, sugar, milk, etc
		@category = category   # dairy, meat, produce, (which section of grocery store)
	end

end
