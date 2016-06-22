# Intermediate Rails (Upcase Trail)

##Lesson 1
Teacher: Matt Mongeau

### 1. Review how to set up a Rails application
He uses Rails 3.2.12, Ruby 1.9.3p374 (really old)

`rails new APP_NAME --skip-bundle --skip-test`

1. Set up app
	- he adds `strong_parameters` but that is included in rails 4
	- he adds `gem monban` which is a user authentication gem that he designed.
	- `rails g monban:scaffold` generates the model, controller, views for the gem. This is how all generators work.
2. App development
	- when creating routes, specify exactly what you want the route to be, don't just leave it blank
	- this allows other developers to know exactly what your intents are, and doesn't leave any kind
of ambiguity in your code.

## Lesson 2

### 1. App Development Tips

1. Always use one of the seven resourceful actions
	- identify your controllers and your actions
	- describe a new function in terms of some verb (name of action) and the name of the thing
	- ex read\write\update\delete a certain model with an action name
	- break things out to other classes, keep controllers just to the seven actions

2. Use a scratch pad or scratch doc to write out planning the layout of the app
	- when thinking about how to build data structures - avoid as many null columns as possible, split out into separate models/tables if you can
	- **STI** single table inheritance is where two models have the same data in the database but different behaviors (i.e. pets and owners both have names, birthdays, but owners don't get shots and pets don't have account balances).
	- Using the same example, you could imagine fish cats and dogs being under STI
	- **Polymorphism**
	- you can set up an assoc of one object and the assoc content can be of any type
	- ex text and photo shouts
	- on the shouts table add two fields - `content_id` and `content_type`
	- first thing to do is to split text shouts from shouts
		1. create database migrations
			- first we created the text_shout table with one column "body"
			- next we removed the body from the shouts table and added `content_type` and `content_id` to the shouts table with indexes.
		2. next we changed the name of the form variable to text_shouts, which caused an error with the controller.
		3. we created text_shouts controller and moved the "create" logic from the shouts controller to the text_shouts controller
		4. next we changed the logic of the shouts model to `belongs_to: content` and `polymorphic: true`

3. complex database relations
	- when creating relationships between two rows of the same table, in rails they have to be made through another table altogether
	- in this example we created a table called `following_relationships` that represented who followed whom.
	- this was achieved by creating several `has_many` relationships on the user model
	- make sure to use `foreign_key`, `through:`, and `class_name:` statements in the `has_many` relationship declarations
	- whenever doing a complicated single-table relationship mode, refer back to this codebase.


##Todos
1. Rails template?
2. Review test driven rails trail for the gems used in testing and development
3. look into guard/spork?
