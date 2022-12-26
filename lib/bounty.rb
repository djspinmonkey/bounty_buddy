class Bounty
  attr_accessor :name, :requirements, :vendor

  def initialize(name, requirements, vendor)
    @name = name
    @requirements = requirements
    @vendor = vendor
  end

  def universal? = requirements.empty?
end
