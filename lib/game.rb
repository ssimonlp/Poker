class Game
  # Class method to check for the winner at each line
  # If no winner is found, the method is called recursively
  # on arrays where  winning hands have been removed
  def self.winner(h1, h2)
    new_hand1  = h1.score[0]
    new_hand2  = h2.score[0]
    s1 = h1.score[1]
    s2 = h2.score[1]

    return 1 if s1 > s2
    return 2 if s2 > s1

    winner(Hand.new(new_hand1), Hand.new(new_hand2))
  end
end
