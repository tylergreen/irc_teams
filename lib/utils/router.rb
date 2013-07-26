class Router
  def initialize(routes)
    @routes = routes
  end

  def route(string)
    route = @routes.find{ |r| r.match(string) }
    route.exec if route
  end
end
