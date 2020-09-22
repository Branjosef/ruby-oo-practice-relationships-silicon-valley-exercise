class FundingRound

  attr_accessor :type, :investment
  attr_reader :startup, :v_cap

  @@rounds = []

  def initialize (startup, v_cap, type, investment)
    @startup = startup
    @v_cap = v_cap
    @type = type
    @investment = investment
    @@rounds.push(self)
  end

  def type
    @type
  end

  def investment
    @investment
  end

  def self.all
    @rounds
  end


end
