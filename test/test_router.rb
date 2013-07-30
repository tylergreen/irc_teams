require "test/unit"
require 'utils/router'

describe Router do
 before do
    routes = [ Route.new(/join (.+)/) { |user, match_data| "#{ user } joined team #{match_data[1]}!" },
               Route.new(/leave (.+)/) { |user, match_data| "#{ user} left team #{match_data[1]}!" }
             ]
    @router = Router.new(routes)
  end

  it 'finds the first route that matches and runs the matching routes block' do
    assert_equal(@router.route('juan', 'join chelsea'), 'juan joined team chelsea!')
    assert_equal(@router.route('drogba','leave juventus'), 'drogba left team juventus!')
  end

  it 'returns nil if no team is found' do
    assert(@router.route('lebowski', 'play checkers').nil?, 'should have returned nil')
  end
end
    
