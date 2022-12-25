class BountyOptimizer
  attr_accessor :guardian, :available_bounties, :available_activities

  def initialize(available_activities, available_bounties)
    @available_activities = available_activities
    @available_bounties = available_bounties
  end

  def bounties_for(activity)
    @available_bounties.select { |bounty| activity.completes?(bounty) }
  end

  def recommended_activities
    activities = available_activities.inject({}) do |hash, activity|
      hash[activity] = bounties_for activity
      hash
    end

    activities.sort_by { |activity, bounties| -bounties.length }.to_h
  end

  # Possible optimizations:
  #   - Take into account already-completed bounties after each step, or
  #     separate out the "must complete now" vs "can complete later" ones.
  #   - Distinguish between bounties that are best completed in a given
  #     activity vs ones that technically could be. Eg, it's not ideal to do
  #     random loadouts in Crucible for weapon bounties - it would be better to
  #     do those in PvE activities instead.
end
