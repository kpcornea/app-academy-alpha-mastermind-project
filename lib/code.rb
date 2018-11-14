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
    Code.new(Array.new(length, POSSIBLE_PEGS.keys.sample))
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
  #rspec real pegs are RGRB
  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, i|
      count += 1 if @pegs[i] == peg
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, i|
      count += 1 if pegs.include?(peg) && @pegs[i] != peg
    end
    count
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end

end
