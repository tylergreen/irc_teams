require 'set'

class Team < Set
  attr_reader :name

  def initialize(name)
    super([])
    @name = name
  end
  
end
