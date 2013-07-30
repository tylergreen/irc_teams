require "test/unit"
require 'irc_teams/team_list'

describe TeamList do
  before do
    @list = TeamList.new
    @list.create_team('Napoli')
  end

  it 'can create a new team' do
    assert(@list.teams['Juventus'].nil?)
    @list.create_team('Juventus')
    assert(@list.teams['Juventus'])
  end

  it 'can add someone to a team' do
    assert( @list.add_player('Gervinho', 'Napoli'))
    assert_includes(@list.teams['Napoli'], 'Gervinho')
  end

  it 'can remove someone from a team' do
    assert( @list.remove_player('Gervinho', 'Napoli'))
    assert(not(@list.find_team('Napoli').include?('Gervinho')))
  end

  it 'can find what team a player is on' do
    assert( @list.add_player('Gervinho', 'Napoli'))
    assert_equal('Napoli', @list.find_team_by_player('Gervinho').name)
  end

  it 'can remove a team' do
    assert(@list.find_team('Napoli'))
    @list.remove_team('Napoli')
    assert_raises(RuntimeError) { @list.find_team('Napoli') } 
  end
end
