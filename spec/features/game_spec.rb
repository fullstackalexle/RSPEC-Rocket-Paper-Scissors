require 'rails_helper'

feature "User playing the game" do
  scenario "when user wins game" do
    visit '/games/new'
    pending
    # stub the games action choice
    # user chooses action
    # user sees user won and the action outcome
  end

  scenario "when user loses game" do
    visit '/games/new'
    pending
    # stub the games action choice
    # user chooses action
    # user sees user won and the action outcome
  end
end

feature "User visits website" do
  scenario "sees a list of games and can view them" do
    pending
  end

  scenario "can start a new game" do
    pending
  end
end
