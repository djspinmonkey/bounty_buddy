class BountyOptimizer
  attr_accessor :guardian, :available_bounties, :available_activities

  def initialize(guardian, available_activities, available_bounties)
    @guardian = guardian
    @available_activities = available_activities
    @available_bounties = available_bounties
  end

  def source_of(bounty)
    if @guardian.bounties.include?(bounty)
      :inventory
    else
      bounty.vendor
    end
  end

  def sourced_bounties_for(activity)
    @available_bounties
      .reject(&:universal?)
      .select { |bounty| activity.completes?(bounty) }
      .group_by { |bounty| source_of(bounty) }
  end

  def sourced_universal_bounties
    available_bounties.select(&:universal?).group_by { |bounty| source_of(bounty) }
  end

  def sourced_activity_bounties
    activities = available_activities.inject({}) do |hash, activity|
      hash[activity] = sourced_bounties_for(activity)
      hash
    end

    activities.sort_by do |activity, sourced_bounties|
      -sourced_bounties.values.map(&:length).sum
    end.to_h
  end

end
