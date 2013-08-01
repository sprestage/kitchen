#!/usr/bin/env ruby
### recipe.rb
require './kitchen'

class Recipe < Kitchen
	attr_reader :name
	def initialize(name, ingredients=INGREDIENTS_DEFAULT, directions=DIRECTIONS_DEFAULT)
		@name = name
		@ingredients = ingredients
		@directions = directions
	end

	def whatIngredients
		return @ingredients
	end

	def whatDirections
		return @directions
	end
end

