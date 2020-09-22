class VentureCapitalist

attr_accessor :name, :worth
attr_reader

@@all = []

def initialize (name, worth)
  @name = name
  @worth = worth.to_f
  @@all.push(self)
end

def name
  @name
end

def total_worth
  @worth
end

def self.all
  @@all
end

def self.tres_commas_club
  self.all.map {|d_bags| 
  if d_bags.total_worth > 1000000000  
    d_bags
  end
  }
end

def offer_contract (startup, type, investment)
  FundingRound.new(startup, self, type, investment)
end

def funding_rounds
  FundingRound.all.select {|rounds| rounds.v_cap == self.name }  #select returns the statement in the array, map only returns trur/false statments 
  
end

def portfolio
  portfolio = self.funding_rounds.map {|rounds| rounds.startup}
  portfolio.uniq
end

def biggest_investment
  big = self.funding_rounds.map {|rounds| rounds.investment.to_i}
  big.max
end

   def invested(domain)
    domain_match = Startup.all select {|startups| startups.domain == domain}
    #domain_match.select {|startups|}
    
   end

end
