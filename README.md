# Rocket, Paper-plane, Scissors Challenge!

## Learning Objectives
- using Rspec with Rails
- familiarize yourself with rspec style
- write code to fix tests
- write tests to fix code

## Summary

This is a little variation on rock, paper, scissors.  The user gets
to choose Rocket, Paper-plane, or Scissors.  Then the computer
randomly "throws" and we determine a winner.

This app works and is pretty spiffy, but we have a bunch of untested
code and a bunch of tests that are failing.

Can you help us by fixing them?

## Releases

### RULES

1. You are not allowed to edit existing views 
2. You are not allowed to modify existing tests, except when removing `pending` 
to complete the implementation

### Release 0: Run it

1. Clone the repository
2. `bundle`
3. Set up your database `rake db:setup`
4. Start the Rails application by running 
`bundle exec rails server`

Play around. It's fun!

### Release 1: Fix the existing unit tests that are failing

Fix the Rails application so that the existing tests pass.

Go in the following order:
- model tests
- controller tests

### Release 2: Implement pending tests
Implement the tests marked as pending

### Release 3: Implement integration tests
Implement the feature tests in `spec/features`.

### Release 4: Ties!

Did you notice that the game doesn't handle ties?

Using BDD, implement the logic to handle a tie.

## Resources

The following screencasts are HIGHLY recommended:

- http://railscasts.com/episodes/257-request-specs-and-capybara
- http://railscasts.com/episodes/275-how-i-test

