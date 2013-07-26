require "test/unit"
require 'utils/router'

describe Router do
 before do
    routes = [ Route.new(/join (.+)/) { |match_data| "joined team #{match_data[1]}!" },
               Route.new(/leave (.+)/) { |match_data| "left team #{match_data[1]}!" }
             ]
    @router = Router.new(routes)
  end

  it 'finds the first route that matches and runs the matching routes block' do
    assert_equal(@router.route('join chelsea'), 'joined team chelsea!')
    assert_equal(@router.route('leave juventus'), 'left team juventus!')
  end

  it 'returns nil if no team is found' do
    assert(@router.route('play checkers').nil?, 'should have returned nil')
  end
end
    
