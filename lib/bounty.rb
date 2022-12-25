class Bounty
  attr_accessor :name, :requirements

  def initialize(name, requirements)
    @name = name
    @requirements = requirements
  end

  def universal? = requirements.empty?
end
