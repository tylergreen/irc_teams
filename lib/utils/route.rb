class Route
  def initialize(pattern, &action)
    @pattern = pattern
    @action = action
    @match = nil
  end

  def match(string)
    @match = @pattern.match(string)
  end

  # optimization: this could be asyncronous
  def exec(user)
    raise "Route needs to be matched before it can be exec'd!" unless @match
    @action.call(user, @match)
  end
end
