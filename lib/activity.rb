class Activity
  attr_accessor :name, :tags

  def initialize(name, tags)
    @name = name
    @tags = tags
  end

  def provides?(tag) = tags.include?(tag)

  def completes?(bounty) = bounty.requirements.all? { |tag| self.provides?(tag) }
end
