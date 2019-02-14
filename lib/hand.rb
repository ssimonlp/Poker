class Hand
  attr_reader :rank
  attr_reader :type
  attr_accessor :val

  # Method to initialize an instance of the class
  # val is an array containg all the cards oh the Hand
  # I check if the array passed as an argument already contains Card instances
  # because of the recursiv calls
  def initialize(array)
    @val = []
    array.each do |arr|
      @val << (arr.is_a?(Card) ? arr : Card.new(arr))
    end
    @val.sort_by!(&:rank)
  end

  private

  # A methods that renders an array containing only the duplicates
  # I first count the duplicates and store them inside of a hash
  # then I fill an array with the values of @val that corresponds to the keys
  # of the hash
  def repeats(x)
    arr = []
    hash = Hash.new(0)
    val.each do |v|
      hash[v.rank.to_s] += 1
    end
    hash.each do |k, v|
      arr << val.select { |e| e.rank == k.to_i } if v == x
    end
    arr.empty? ? false : arr.flatten
  end

  public

  def highest?
    val.last
  end

  def pair?
    repeats(2)
  end

  def two_pairs?
    if pair?
      pair?.count == 4 ? pair? : false
    else
      false
    end
  end

  def three_of_a_kind?
    repeats(3)
  end

  def four_of_a_kind?
    repeats(4)
  end

  def full?
    return val if three_of_a_kind? && pair?

    false
  end

  # I check if an array composed by the ranks of val equals the array
  # formed by all integers between the min and max ranks of val
  def straight?
    return val if (temp = val.map(&:rank)) == (temp.min..temp.max).to_a

    false
  end

  # I check if the number of different suits equals to one
  def flush?
    return val if val.map(&:suit).uniq.count == 1

    false
  end

  def straight_flush?
    return val if straight? && flush?

    false
  end

  def royal_flush?
    return val if straight_flush? && (val.map(&:rank).max == 13)

    false
  end

  # I return an array formed by a sub array of val where there is no more
  # winning hands and by the score oh the player for the line
  def score
    if g = royal_flush?
      r = 5000
    elsif g = straight_flush?
      r = 4000 + g.last.rank
    elsif g = four_of_a_kind?
      r = 3500 + g.first.rank
    elsif g = full?
      high1 = three_of_a_kind?.first.rank
      high2 = pair?.first.rank
      r = 3000 + high1 * 100 + high2
    elsif g = flush?
      highest = g.last.rank
      r = 2500 + highest
    elsif g = straight?
      r = 2000 + g.last.rank
    elsif g = three_of_a_kind?
      r = 1500 + 100 * g.first.rank
    elsif g = two_pairs?
      high1 = g.last.rank
      high2 = g.first.rank
      r = 1000 + 100 * high1 + high2
    elsif g = pair?
      r = 500 + g.first.rank
    else
      g = highest?
      r = highest?.rank
    end
    [val - [g].flatten, r]
  end
end
