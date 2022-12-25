require_relative '../lib/activity'
require_relative '../lib/bounty'
require_relative '../lib/bounty_optimizer'

activities = [
  Activity.new("Vanguard Ops", [:vanguard_ops, :pve, :cabal, :fallen, :vex, :hive]),
  Activity.new("Crucible", [:crucible, :pvp]),
  Activity.new("Gambit", [:gambit, :pve, :pvp]),
  Activity.new("Seraph Shield", [:seasonal, :pve, :fallen, :hive]),
  Activity.new("Delivering Cookies", [:baking]),
]

bounties = [
  Bounty.new("Kill A Buncha Dregs", [:pve, :fallen]),
  Bounty.new("Kill A Buncha Guardians", [:pvp]),
  Bounty.new("Get A Precision Kill", []),
  Bounty.new("Sniper Kills In Strikes", [:pve, :vanguard_ops]),
  Bounty.new("Grenade Kills In Crucible", [:pvp, :crucible]),
  Bounty.new("Teabag A Streamer", [:pvp]),
  Bounty.new("Deliver Eighty Billion Cookies", [:baking]),
  Bounty.new("Pulse Rifle Kills in Seasonal Activities", [:pve, :seasonal]),
  Bounty.new("Pick Up Three Seasonal Doodads", [:seasonal]),
  Bounty.new("Taunt A Wizard", [:pve, :hive]),
  Bounty.new("Oh My God More Currencies Why", [:seasonal]),
  Bounty.new("Ok Now Eighty Billion More Cookies", [:baking]),
  Bounty.new("Pee On A Hive Knight", [:hive]),
  Bounty.new("Win The Great Guardian Bake-Off", [:baking]),
]

optimizer = BountyOptimizer.new(activities, bounties)
recommendations = optimizer.recommended_activities

puts "We recommend you do the following activities in this order. Note that some of the bounties can be completed in more than one step."

recommendations.each do |activity, bounties|
  puts activity.name
  bounties.each { |bounty| puts "  - #{bounty.name}" }
end

puts "Feel free to skip any you don't care for, of course. Have fun!"
