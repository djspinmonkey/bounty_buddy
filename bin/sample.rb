require_relative '../lib/activity'
require_relative '../lib/bounty'
require_relative '../lib/bounty_optimizer'
require_relative '../lib/guardian'

def print_shopping_list_for(guardian, bounties)
  bounties_in_inv = bounties.select { |bounty| guardian.bounties.include?(bounty) }
  if bounties_in_inv.any?
    puts "  Already in inventory:"
    bounties_in_inv.each do |bounty|
      puts "    - #{bounty.name}"
    end
  end

  bounties_to_buy = bounties - bounties_in_inv
  bounties_to_buy.group_by(&:vendor).each do |vendor, bounties|
    puts "  Purchase from #{vendor}:"
    bounties.each do |bounty|
      puts "    - #{bounty.name}"
    end
  end
end

activities = [
  Activity.new("Vanguard Ops", [:vanguard_ops, :pve, :cabal, :fallen, :vex, :hive]),
  Activity.new("Crucible", [:crucible, :pvp]),
  Activity.new("Gambit", [:gambit, :pve, :pvp]),
  Activity.new("Seraph Shield", [:seasonal, :pve, :fallen, :hive]),
  Activity.new("Delivering Cookies", [:baking]),
]

bounties = [
  Bounty.new("Kill A Buncha Dregs", [:pve, :fallen], "Ikora"),
  Bounty.new("Kill A Buncha Guardians", [:pvp], "Ikora"),
  Bounty.new("Get 10 Precision Kills", [], "Zavala"),
  Bounty.new("Get 8 Kills with a Pulse Rifle", [], "Banshee"),
  Bounty.new("Get 32.5 Kills with a Rocket Launcher", [], "Banshee"),
  Bounty.new("Sniper Kills In Strikes", [:pve, :vanguard_ops], "Zavala"),
  Bounty.new("Grenade Kills In Crucible", [:pvp, :crucible], "Shaxx"),
  Bounty.new("Teabag A Streamer", [:pvp], "Twitch"),
  Bounty.new("Deliver Eighty Billion Cookies", [:baking], "Eva"),
  Bounty.new("Pulse Rifle Kills in Seasonal Activities", [:pve, :seasonal], "Clovis's Torso"),
  Bounty.new("Pick Up Three Seasonal Doodads", [:seasonal], "Clovis's Torso"),
  Bounty.new("Taunt A Wizard", [:pve, :hive], "Eris"),
  Bounty.new("Oh My God More Currencies Why", [:seasonal], "Clovis's Torso"),
  Bounty.new("Ok Now Eighty Billion More Cookies", [:baking], "Eva"),
  Bounty.new("Pee On A Hive Knight", [:hive], "Eris"),
  Bounty.new("Win The Great Guardian Bake-Off", [:baking], "Eva"),
]

guardian = Guardian.new("Bountiful Bill", bounties.first(3))

optimizer = BountyOptimizer.new(activities, bounties)
recommendations = optimizer.recommended_activities

puts "Welcome to the sample script, #{ guardian.name }! We see that you have these bounties already in your inventory:"
guardian.bounties.each do |bounty|
  puts "  - #{bounty.name}"
end
puts

puts "The following bounties can be done *anywhere*, so we recommend you pick them up regardless of your plans for the day, unless they just don't look fun to you."
print_shopping_list_for(guardian, bounties.select(&:universal?))
puts

puts "To optimize your bounty completions today, we recommend you do the following activities in this order. Note that some of the bounties can be completed in more than one step."

recommendations.each do |activity, bounties|
  puts activity.name
  print_shopping_list_for(guardian, bounties.reject!(&:universal?))
end

puts
puts "Feel free to skip any you don't care for, of course. Have fun!"
