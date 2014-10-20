require 'rails_helper'

RSpec.describe "Games", :type => :request do
  describe "GET /games" do
    it "is successful" do
      get games_path
      expect(response.status).to be(200)
    end
  end

  describe "GET /new" do
    it "is successful" do
      get new_game_path
      expect(response.status).to be(200)
    end
  end
end
