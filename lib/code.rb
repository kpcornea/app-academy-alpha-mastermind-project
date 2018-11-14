class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.key?(char.upcase) }
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "An error occurred"
    end
  end

  def self.random(length)
    arr = []
    (1..length).each { arr << POSSIBLE_PEGS.keys.sample }
    Code.new(arr)
  end

  def self.from_string(pegs)
    Code.new(pegs.chars)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, i|
      count += 1 if self.[](i) == peg
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, i|
      count += 1 if pegs.include?(peg) && self.[](i) != peg
    end
    count
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end
end
