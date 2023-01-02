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
      .select { |bounty| activity.best_for?(bounty) }
      .group_by { |bounty| source_of(bounty) }
  end

  def sourced_universal_bounties
    available_bounties.select(&:universal?).group_by { |bounty| source_of(bounty) }
  end

  # Returns a hash with the following structure:
  #
  #   {
  #     some_activity => {
  #       efficiency: 10,
  #       bounties: {
  #         inventory: [some_bounty, another_bounty],
  #         "A Vendor": [yet_another_bounty]
  #       }
  #     },
  #     a_lesser_activity => {
  #       efficiency: 3,
  #       bounties: {
  #         "Another Vendor": [just_one_bounty]
  #       }
  #     }
  #   }
  #
  # The list of bounties includes only non-universal bounties - they may apply
  # to other activities as well, but not _all_ activities. This efficiency
  # metric takes into account the number of bounties completable in an
  # activity, which activities are best for which types of bounties, and
  # whether the bounties give bonus progress in certain types of activities.
  # The hash will be sorted by the efficiency score, with the highest scoring
  # activities first.
  #
  def ranked_activities_with_bounties
    ranked_activities = {}

    available_activities.each do |activity|
      efficiency = 0
      bounties = Hash.new { |h,k| h[k] = [] }
      available_bounties.each do |bounty|
        next unless activity.completes?(bounty)
        efficiency += bounty.efficiency(activity)
        bounties[source_of(bounty)] << bounty
      end

      ranked_activities[activity] = { efficiency: efficiency, bounties: bounties }
    end

    ranked_activities.sort_by { |activity, attrs| -attrs[:efficiency] }
  end

end
