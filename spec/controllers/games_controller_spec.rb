require 'rails_helper'

describe GamesController do
  let!(:game) { Game.create!(user_throw: Game::THROWS.sample) }

  describe "GET #index" do
    it "assigns all games as @games" do
      get :index
      expect(assigns(:games)).to eq([game])
    end
  end

  describe "GET #show" do
    it "assigns the requested game as @game" do
      get :show, { id: game.to_param }
      expect(assigns(:game)).to eq(game)
    end

    it "assigns winner throw" do
      get :show, { id: game.to_param }
      expect(assigns(:winner_throw)).to eq game.winner_throw
    end

    it "assigns loser throw" do
      get :show, { id: game.to_param }
      expect(assigns(:loser_throw)).to eq game.loser_throw
    end
  end

  describe "GET #new" do
    it "checks to see if exists" do
      get :new
      expect(assigns(:game)).to be
    end
  end

  describe "POST create" do
    context "when valid params are passed" do
      it "creates a new Game" do
        expect{ post :create, game: {user_throw: Game::THROWS.sample} }.to change(Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, game: {user_throw: Game::THROWS.sample}
        expect(assigns(:game)).to eq Game.last
      end

      it "redirects to the created game" do
        post :create, game: {user_throw: Game::THROWS.sample}
        expect(assigns(:game)).to eq Game.last
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved game as @game" do
        post :create, game: {user_throw: "NIL"}
        expect(assigns(:game)).to be
      end

      it "re-renders the 'new' template" do
        post :create, game: {user_throw: "NIL"}
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested game as @game" do
      delete :destroy, { id: game.to_param }
      expect(assigns(:game)).to eq(game)
    end

    it "destroys the requested game" do
      expect{ delete :destroy, id: game.id}.to change(Game, :count).by(-1)
    end

    it "redirects to the games list" do
      delete :destroy, id: game.id
      expect(response).to redirect_to games_path
    end
  end

end
