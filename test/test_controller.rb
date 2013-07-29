require "test/unit"
require 'irc_teams/controller'

describe Controller do
  before do
    @c = Controller.new
    @c.create_team('Napoli')
  end
  
  it 'can create a team' do
    assert(@c.teams['Juventus'].nil?)
    @c.create_team('Juventus')
    assert(@c.teams['Juventus'])
  end

  it 'can add someone to a team' do
    assert(not(@c.teams['Napoli'].include?('Gevinho')))
   assert_send( @c.add_player('Gervinho', 'Napoli')
    assert_includes(@c.teams['Napoli'], 'Gervinho')
    assert_equal(response, 'Gervinho added to Napoli')
  end
  
end
