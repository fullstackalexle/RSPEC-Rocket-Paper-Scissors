class Game < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(5) }

  THROWS = %w(rocket paper-plane scissors)
  PLAYERS = %w(user computer)

  validates :computer_throw, presence: true,
    inclusion: { in: THROWS, message: "%{value} is not a valid throw" }

  validates :user_throw, presence: true,
    inclusion: { in: THROWS, message: "%{value} is not a valid throw" }

  validates :winner, presence: true,
    inclusion: { in: PLAYERS, message: "%{value} is not a valid player" }

  before_validation :set_computer_throw, only: :create
  before_validation :determine_winner, only: :create

  def determine_winner
    return winner if PLAYERS.include?(winner)

    if first_wins?(computer_throw, user_throw)
      self.winner = 'computer'
    else
      self.winner = 'user'
    end

    return winner
  end

  def winner_throw
    send("#{winner}_throw")
  end

  def loser_throw
    return user_throw if winner == 'computer'
    return computer_throw if winner == 'user'
  end

  private

  def set_computer_throw
    self.computer_throw ||= THROWS.sample
  end

  def first_wins?(throw1, throw2)
    return true if throw1 == 'paper-plane' && throw2 == 'rocket'
    return true if throw1 == 'scissors' && throw2 == 'paper-plane'
    return true if throw1 == 'rocket' && throw2 == 'scissors'
    false
  end
end
