class Card
  attr_reader :rank
  attr_reader :suit

  # Class Variable with new ranks,  getting rid of alphabetic values
  @@rank_values = {
    '2' => 1,
    '3' => 2,
    '4' => 3,
    '5' => 4,
    '6' => 5,
    '7' => 6,
    '8' => 7,
    '9' => 8,
    'T' => 9,
    'J' => 10,
    'Q' => 11,
    'K' => 12,
    'A' => 13
  }

  # Private method to reaasign the new ranks
  private

  def cardify(str)
    [@@rank_values[str[0]], str[1]]
  end

  # public method to initialize the class
  public

  def initialize(str)
    @rank = cardify(str)[0]
    @suit = cardify(str)[1]
  end
end
