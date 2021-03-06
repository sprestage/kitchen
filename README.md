Kitchen
=======

This was my first ruby application, written <b>before</b> the Ruby on
Rails Code Fellows bootcamp as a part of my application to the class.

Looking back on this, it isn't so good.  So, I'm adding a badge for
Code Climate as an inspiration to come back and clean this up.  :)

[![Code Climate](https://codeclimate.com/github/sprestage/kitchen.png)](https://codeclimate.com/github/sprestage/kitchen)
=======
This started as a coding challenge to go along with the Code Fellows Ruby on Rails bootcamp application.

Inital version is now complete.  Additional features are planned.
Aug 19, 2012.  -sprestage


How to run
=======
This program is designed to be run from a command line.  Typically, like this:
<pre>
	~> ruby kitchen
</pre>


What kitchen does
=======

There are two main functions of a 'kitchen'.  One is to keep track of your pantry of items that
mights get used in a recipe.  The other is to keep track of your book of recipes that use those
pantry items.  The idea is to link the two so that once the recipe book and the pantry are populated
with data, the user can ask for things like recipes with chicken, or the likely to be needed grocery
list for Chicken Tetrazini.



How this is implemented:

kitchen.rb - This is the heart of the program.  The Kitchen class is here, where the Pantry
and the Recipe Book are located.  File input/output resides here.  As does user interface.

recipe.rb - This is where the individual recipe manipulation happens before they are ready to
be stored in the big Recipe Book (in kitchen.rb).

pantry_item.rb - This is where each pantry item is manipulated before they are ready to be
stored in the big Pantry (in kitchen.rb).

ui.rb - This is where the user interface interacts with the user and makes changes to the data.

config.rb - Keeps all the global constants in one place.  Perhaps there is a better way to do this.

spec/*_spec.rb - Unit tests for all of the above.



=======
TODO
=======

NICE TO HAVE FEATURES (for later implementation consideration)
<ol>
  <li>Add inStock to PantryItems</li>
  <li>Add a glutenFree and dairyFree to Recipes and PantryItems, or perhaps just a aaronSafe bit for both.</li>
  <li>List pantry items by category, frozen, staple</li>
  <li>List pantry items needed for recipe</li>
  <ol>
    <li>list frozen/not frozen items needed for recipe</li>
    <li>list staple/not staple items needed for recipe</li>
    <li>list items by all categories</li>
    <li>list only items in given categories</li>
  </ol>
  <li>List recipes that fit certain parameters (like GF, dairy free, etc)</li>
  <li>Need to validate input from user.  Particularly for filenames/paths.  Currently, this program assumes a benign user.</li>
  <li>Switch from flat file data storage to database data storage.</li>
  <li>Convert executable application to a web application, then deploy on Heroku.</li>
</ol>


Design decisions
=======

A flat file for data storage is being chosen initially.  This will work nicely for the
interim as recipe books and items in a pantry are quite finite.  Eventually though, this
should be updated to use a database.  It will be natural to implement this when the program
is also converted into a web application.

