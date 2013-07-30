require "test/unit"
require 'irc_teams/league'

describe League do
  before do
    @league = League.new
    @league.create_team('Napoli')
  end

  it 'can create a new team' do
    @league.create_team('Juventus')
    assert(@league.find_team('Juventus'))
  end

  it 'will not create an existing team' do
    assert_raises(LeagueError) { @league.create_team('Napoli') }
  end

  it 'can remove someone from a team' do
    assert( @league.add_player('Gervinho', 'Napoli'))
    assert( @league.remove_player('Gervinho', 'Napoli'))
    assert(@league.find_team_by_player('Gervinho').nil?)
  end

  it 'can find what team a player is on' do
    assert( @league.add_player('Gervinho', 'Napoli'))
    assert_equal('Napoli', @league.find_team_by_player('Gervinho').name)
  end

  it 'will not add a player to a team that it is already on' do
    assert( @league.add_player('Gervinho', 'Napoli'))
    assert_raises(LeagueError) { @league.add_player('Gervinho', 'Napoli') }
  end

  it 'can remove a team' do
    assert(@league.find_team('Napoli'))
    @league.remove_team('Napoli')
    assert_raises(NonExistentTeamError) { @league.find_team('Napoli') } 
  end
end
