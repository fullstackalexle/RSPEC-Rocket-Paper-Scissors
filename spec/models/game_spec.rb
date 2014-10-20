require 'rails_helper'

describe Game do
  let(:game) { Game.new }

  describe "#recent" do
    it "selects the 5 most recently created games" do
      expect(Game.recent).to match_array(Game.order(created_at: :desc).limit(5))
    end
  end

  describe "#computer_throw" do
    it "automatically sets computer_throw" do
      game = Game.create
      expect(%w(rocket paper-plane scissors)).to include (game.computer_throw)
    end

    it "only sets the computer_throw once" do
      game.user_throw = 'paper-plane'
      game.save
      orig_throw = game.computer_throw

      game.user_throw = 'rocket'
      game.save
      expect(orig_throw).to eq(game.computer_throw)
    end
  end

  describe "validations" do
    it "is valid when it's rocket" do
      game.valid?
      expect(game.errors[:computer_throw]).to be_empty
    end

    it "is valid when it's paper-plane" do
      game.valid?
      expect(game.errors[:computer_throw]).to be_empty
    end

    it "is valid when it's scissors" do
      game.valid?
      expect(game.errors[:computer_throw]).to be_empty
    end

    it "is NOT valid when it's rock" do
      allow(game).to receive(:computer_throw) { 'rock' }
      game.valid?
      expect(game.errors[:computer_throw]).to_not be_empty
    end

    it "is NOT valid when it's empty" do
      allow(game).to receive(:computer_throw) { nil }
      game.valid?
      expect(game.errors[:computer_throw]).to_not be_empty
    end
  end

  describe "#user_throw" do
    it "should be an attribute of Game object" do
      game.should respond_to(:user_throw)
    end
  end

  describe "#winner" do
    it "sets a winner when saved" do
      game.user_throw = 'rocket'
      game.save
      expect(game.winner).to be
    end

    it "only sets the winner once" do
      game.user_throw = 'rocket'
      game.save
      winner = game.winner
      expect(Game.last.winner).to eq winner
    end
  end

  describe "validations" do
    it "does not save a game that does not pass the required validations" do
      game.save
      expect(game.id).to eq nil
    end
  end

  describe "#determine_winner" do
    context "when computer_throw is paper-plane" do
      before do
        allow(game).to receive(:computer_throw) { 'paper-plane' }
      end

      it "determines computer won if user_throw is rocket" do
        game.user_throw = 'rocket'
        expect(game.determine_winner).to eq('computer')
      end

      it "determines user won if user_throw is scissors" do
        game.user_throw = 'scissors'
        expect(game.determine_winner).to eq('user')
      end
    end

    context "when computer throws rocket" do
      before do
        allow(game).to receive(:computer_throw) { 'rocket' }
      end

      it "determines computer won if user_throw is scissors" do
        game.user_throw = 'scissors'
        expect(game.determine_winner).to eq('computer')
      end

      it "determines user won if computer_throw is paper-plane" do
        game.user_throw = 'paper-plane'
        expect(game.determine_winner).to eq('user')
      end
    end

    context "when computer throws scissors" do
      before do
        allow(game).to receive(:computer_throw) { 'scissors' }
      end

      it "determines computer won if user_throw is paper-plane" do
        game.user_throw = 'paper-plane'
        expect(game.determine_winner).to eq('computer')
      end

      it "determines user won if computer_throw is rocket" do
        game.user_throw = 'rocket'
        expect(game.determine_winner).to eq('user')
      end
    end
  end
end
