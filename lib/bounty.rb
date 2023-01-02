class Bounty
  attr_accessor :name, :tag, :vendor, :bonus_tags, :element, :weapon

  UNIVERSAL_TAGS = %i[weapon element]

  def self.load_from_file(filename)
    bounties = []

    raw_bounties = Psych.safe_load_file filename
    raw_bounties.each do |vendor, vendor_bounties|
      vendor_bounties.each do |name, attrs|
        tag = attrs&.fetch("tag", nil)&.to_sym
        bonus_tags = Array(attrs&.fetch("bonus", nil)).map(&:to_sym)
        element = attrs&.fetch("element", nil)
        weapon = attrs&.fetch("weapon", nil)
        bounties << Bounty.new(name, tag, vendor, bonus_tags, element, weapon)
      end
    end

    bounties
  end

  def initialize(name, tag, vendor, bonus_tags = [], element = nil, weapon = nil)
    @name = name
    @tag = tag
    @vendor = vendor
    @bonus_tags = bonus_tags
    @element = element
    @weapon = weapon
  end

  def universal? = UNIVERSAL_TAGS.include?(tag)

  def bonus_for?(activity)
    bonus_tags.any? { |tag| activity.all_tags.include?(tag) }
  end

  def efficiency(activity)
    case
    when activity.best_for?(tag) && bonus_for?(activity)  then 5
    when activity.best_for?(tag) && !bonus_for?(activity) then 3
    when activity.can_also?(tag) && bonus_for?(activity)  then 2
    when activity.can_also?(tag) && !bonus_for?(activity)  then 1
    else 0
    end
  end
end
