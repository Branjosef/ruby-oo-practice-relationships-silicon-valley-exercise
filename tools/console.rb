require_relative '../config/environment.rb'
require 'pry'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("startup1", "founder1", "domain1")
startup2 = Startup.new("startup2", "founder1", "domain2")
vc1 = VentureCapitalist.new("vc1", "15000")
vc2 = VentureCapitalist.new("vc2", "2000000000")
vc3 = VentureCapitalist.new("vc3", "3000000000")

vc1.offer_contract(startup1, "type1", "200")
vc1.offer_contract(startup2, "type2", "300")
vc1.offer_contract(startup1, "type3", "400")

#startup1.sign_contract(vc1, "type1", 500)
#startup1.sign_contract(vc2, "type2", 1000)
#startup1.sign_contract(vc2, "type3", 20000)

####can create a few instances in here to play around with####
# fundinground1 = FundingRound.new("Start Up 1", "Capitalist 1", "Type 1", "44444")
# fundinground2 = FundingRound.new("Start Up 1", "Capitalist 1", "Type 2", "9999999")
# fundinground2 = FundingRound.new("Start Up 1", "Capitalist 2", "Type 3", "1111111111111111")
# vc1 = VentureCapitalist.new("Capitalist 1", "2000000000")
# vc2 = VentureCapitalist.new("Capitalist 2", "3000000000")
# vc3 = VentureCapitalist.new("Capitalist 3", "999")
# startup1 = Startup.new("Start Up 1", "Founder 1", "Domain 1")
# startup2 = Startup.new("Start Up 2", "Founder 3", "Domain 2")

binding.pry
#leave this here to ensure binding.pry isn't the last line