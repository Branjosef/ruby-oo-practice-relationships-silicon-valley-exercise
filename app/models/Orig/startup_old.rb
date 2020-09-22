class Startup

  attr_accessor :name, :domain
  attr_reader :founder
  @@all = []

  def initialize(name,founder, domain)   #verify correct ordersta
    @name = name
    @domain = domain
    @founder = founder
    @@all.push(self)
  end

  def name
    @name
  end

  def founder
    @founder
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find {|s| s.founder == founder}
  end

  def self.domains
    self.all.map {|startups| startups.domain} 
  end

  def sign_contract(v_cap, type, investment)    #v_cap is instance variable VentureCapitalist
    FundingRound.new(self, v_cap, type, investment )
  end

  def num_funding_rounds 
   rounds =  FundingRound.all.map {|rounds| rounds.startup == self}
   rounds.count
  end

  def total_funds    #can call this specific method in binding pry  Startup.all[0].total_funds
    rounds =  FundingRound.all.map {|rounds| if 
    rounds.startup == self
    rounds.investment
    end
    }
    rounds.sum
  end

  def investors
    rounds =  FundingRound.all.map {|rounds| if 
    rounds.startup == self
    rounds.v_cap
    end
    }
    rounds.uniq
  end

  def big_investors
    self.investors.select  do |v_cap|
        VentureCapitalist.tres_commas_club.include?(v_cap)
    end


  end




end
