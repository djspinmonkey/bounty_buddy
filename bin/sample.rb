require_relative '../lib/activity'
require_relative '../lib/bounty'
require_relative '../lib/bounty_optimizer'
require_relative '../lib/guardian'

activities = Activity.load_from_file(File.join(File.dirname(__FILE__), '..', 'spec', 'resources', 'activities.yaml'))
bounties = Bounty.load_from_file(File.join(File.dirname(__FILE__), '..', 'spec', 'resources', 'bounties.yaml'))
guardian = Guardian.new("Bountiful Bill", bounties.first(3))
optimizer = BountyOptimizer.new(guardian, activities, bounties)

puts "Welcome to the sample script, #{ guardian.name }! We see that you have these bounties already in your inventory:"
guardian.bounties.each do |bounty|
  puts "  - #{bounty.name}"
end
puts

puts "The following bounties can be done *anywhere*, so we recommend you pick them up regardless of your plans for the day, unless they just don't look fun to you."
optimizer.sourced_universal_bounties.each do |source, bounties|
  bounties.each do |bounty|
    if source == :inventory
      puts "  - #{bounty.name} (already in inventory)"
    else
      puts "  - #{bounty.name} (purchase from #{source})"
    end
  end
end
puts

puts "To optimize your bounty completions today, we recommend you do the following activities in this order. Note that some of the bounties can be completed in more than one step. The 'efficiency' is based on how many bounties are available for that activity, and how easily they can be completed there. For example, Vangaurd Ops is great for weapon bounties, but you might not want to take an unfamiliar loadout into Trials."
optimizer.ranked_activities_with_bounties.each do |activity, attrs|
  puts "#{activity.name} (efficiency: #{attrs[:efficiency]})"
  attrs[:bounties].each do |source, bounties|
    bounties.each do |bounty|
      if source == :inventory
        puts "  - #{bounty.name} (already in inventory)"
      else
        puts "  - #{bounty.name} (purchase from #{source})"
      end
    end
  end
end
puts

puts "Feel free to skip any you don't care for, of course, and have fun!"
