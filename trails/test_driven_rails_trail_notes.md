# Test-Driven Rails

## Why Test?

#### 1. Business Goals

1. The app behaves the way the customer wants
2. The app behaves the way the user expects
3. The app __works__

#### 2. Code Goals

1. The app is understandable
2. The app is refactorable

#### 3. Process Goals

1. The app is written quickly
2. The app is written efficiently 
3. The app is written with trust in mind

## How to Test?

#### Red, Green, Refactor

1. Write a failing test (Red)
2. Write code to make the test pass (Green)
3. Refactor

#### Outside-in Development
##### Overview
1. Acceptance Tests (very high level)
2. Unit Tests (more granular)

##### Specifics
1. Write a failing acceptance test
2. Write a failing unit test
3. Write code to make the unit test pass
4. Write code to make the acceptance test pass
5. Refactor
6. Refactor

##Tools

1. RSpec
2. Capybara (web driver)
3. Factory Girl
4. Shoulda matchers
5. DatabaseCleaner


#Takeaways

##Testing

1. First thing we did was create `user_visit_homepage_spec.rb` and ensure that once the user signed in, they saw `todos#index`
2. Next we added functionality so the user could create a todo. This was implemented by creating `user_creates_todo_spec.rb`, signing in, visiting the root path, then `create_todo()` was called, and `expect(page).to display_todo()` was used to test. `create_todo()` and `display_todo()` were pushed into the `spec/support/todos_helper.rb` file.
3. We added functionality so the user could mark a todo complete, using the same basic test. This time, because we were doing more than just CRUD-ing (aka, changing a value vs. creating as in step 2), we implemented unit testing on `spec/models/todos_spec.rb`. This is the 2nd level of testing. 
4. Last, we implemented the ability to mark a todo back to incomplete, using the same pattern of testing the feature, testing the unit, achieving ***failure parity*** with the feature and unit tests, then implementing code to make the tests pass and refactoring.

###Feature Tests
We start here. We tell the test how we want the app to behave, then implement the functionality however we can, ignoring DRYness and simplicity. This is the only step we used when implementing model-level CRUD features.

###Unit Tests
We utilize these any time we are implementing model-level value changes. We want to achieve ***failure parity*** so we can properly implement functionality. 

###Refactoring
Once we get the tests passing, we want to refactor the code. This can be done in the controller, model, and even the spec level. 

1. Controller Example:
	* moving functionality from the tests to the controller, i.e. CRUD 
2. Model
	* moving functionality from the controller to the model, to ensure proper code adherence
3. Spec
 	* combining repeated code into support modules

#Todos

1. Find and save database_cleaner config
2. Find and save rspec config
 	
