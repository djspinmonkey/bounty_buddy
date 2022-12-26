class Guardian
  attr_accessor :name, :bounties

  def initialize(name, bounties = [])
    @name = name
    @bounties = bounties
  end
end
