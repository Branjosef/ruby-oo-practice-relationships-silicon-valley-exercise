class Startup

  attr_accessor :name, :domain
  attr_reader :founder

  @@all = []

  def intiialize (name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot (domain, name)
    self.domain = domain
    self.name = name
    p self
  end

  def self.all #works
    @@all
  end

  def self.find_by_founder(founder) #works
    self.all.select {|startup| startup.founder == founder}
  end

  def self.domains
    self.all.map {|startup| startup.domain}
  end

  def sign_contract (vc, type, investment)
    FundingRound.new(self, vc, type, investment)
  end

  def total_funds 
    total_funds = []
    FundingRound.all.select do |r| 
      total_funds << r.investment if r.startup.name == self.name
    end
    total_funds.sum
  end

  def num_funding_rounds
    total= FundingRound.all.select {|r| r.startup.name == self.name} 
    total.count
  end

  def investors
    total = []
    FundingRound.all.select do |r| 
      total << r.venture_capitalist if r.startup.name == self.name
      end
    total.uniq
  end

  def big_investors
    self.investors.select  do |v_cap|
      VentureCapitalist.tres_commas_club.include?(v_cap)
    end
  end

end