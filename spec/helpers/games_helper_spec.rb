require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GamesHelper. For example:
#
# describe GamesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

describe GamesHelper do
  describe "#winner_action" do
    context "when winner throw is paper-plane" do
      before do
        assign(:winner_throw, 'paper-plane')
      end

      it "returns confuses when loser threw rocket" do
        assign(:loser_throw, 'rocket')
        expect(helper.winner_action).to eq("confuses")
      end
    end

    context "when winner throw is scissors" do
      before do
        assign(:winner_throw, 'scissors')
      end

      it "returns cut when loser threw paper-plane" do
        assign(:loser_throw, 'paper-plane')
        expect(helper.winner_action).to eq("cut")
      end
    end

    context "when winner throw is rocket" do
      before do
        assign(:winner_throw, 'rocket')
      end

      it "returns melt when loser threw scissors" do
        assign(:loser_throw, 'scissors')
        expect(helper.winner_action).to eq("melts")
      end
    end
  end

  describe "#throw_color" do
    it "returns danger if throw is rocket" do
      expect(throw_color('rocket')).to eq("danger")
    end

    it "returns danger if throw is paper-plane" do
      expect(throw_color('paper-plane')).to eq("success")
    end

    it "returns danger if throw is scissors" do
      expect(throw_color('scissors')).to eq("info")
    end
  end

end
