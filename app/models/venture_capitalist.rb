class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth.to_i
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select {|vc| vc.total_worth > 1000000000.to_i}
  end

  def offer_contract (startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    total= FundingRound.all.select {|r| r.venture_capitalist.name == self.name} 
    total
  end

  def portfolio
      total = []
      FundingRound.all.select do |r| 
        total << r.startup if r.venture_capitalist.name == self.name
        end
      total.uniq
  end

  def biggest_investment
    big = self.funding_rounds.map {|r| r.investment.to_i}
    big.max
  end

  def invested (domain)
    round1 = self.funding_rounds
    round2 = round1.select {|r| r.startup.domain == domain}
    invested = round2.map {|r| r.investment}
    invested.sum
  end

end

