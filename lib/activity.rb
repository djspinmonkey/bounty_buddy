require 'psych'

class Activity
  attr_accessor :name, :best_for, :can_also, :repeatable_bounty_vendor

  def self.load_from_file(file)
    activities = []

    raw_activities = Psych.safe_load_file file
    raw_activities.each do |name, attrs|
      activities << Activity.new(name,
                                 attrs["best_for"].map(&:to_sym),
                                 attrs["can_also"].map(&:to_sym),
                                 attrs["repeatable_bounty_vendor"])
    end

    activities
  end

  def initialize(name, best_for, can_also = [], repeatable_bounty_vendor = nil)
    @name = name
    @best_for = best_for
    @can_also = can_also
    @repeatable_bounty_vendor = repeatable_bounty_vendor
  end

  def best_for?(tag) = best_for.include?(tag)

  def can_also?(tag) = can_also.include?(tag)

  def completes?(bounty) = best_for?(bounty.tag) || can_also?(bounty.tag)

  def all_tags = best_for + can_also
end
