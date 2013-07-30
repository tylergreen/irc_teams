class Router
  def initialize(routes)
    @routes = routes
  end

  def route(user, string)
    route = @routes.find{ |r| r.match(string) }
    route.exec(user) if route
  end
end
