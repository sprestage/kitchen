kitchen
=======

WARNING: THIS PROGRAM IS INCOMPLETE.  
WORK IS ONGOING.  UI TO COME SHORTLY 
Aug 8, 2012.  -sprestage



How to run:		This program is designed to be run from a command line.  Typically, like this:
				
							~> ruby kitchen


What kitchen does:

There are two main functions of a 'kitchen'.  One is to keep track of your pantry of items that
mights get used in a recipe.  The other is to keep track of your book of recipes that use those
pantry items.  The idea is to link the two so that once the recipe book and the pantry are populated
with data, the user can ask for things like recipes with chicken, or the likely to be needed grocery
list for Chicken Tetrazini.


How this is implemented:

kitchen.rb - This is the heart of the program.  The Kitchen class is here, where the Pantry
and the Recipe Book are located.  File input/output resides here.  As does user interface.  
TODO: it is likely that the file input/output and especially the UI should move to another file
at some point.

recipe.rb - This is where the individual recipe manipulation happens before they are ready to
be stored in the big Recipe Book (in kitchen.rb).

pantry_item.rb - This is where each pantry item is manipulated before they are ready to be 
stored in the big Pantry (in kitchen.rb).

config.rb - Keeps all the global constants in one place.  Perhaps there is a better way to do this.

spec/*_spec.rb - Unit tests for all of the above.

