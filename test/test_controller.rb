require "test/unit"
require 'irc_teams/controller'

class TestView
  def show(message, bindings)
    [message, bindings]
  end
end

describe Controller do
  before do
    @c = Controller.new(TestView.new)
    @c.create_team('Arsenal')
  end
  
  it 'can create a team' do
    assert_equal([:team_created, :team => 'Milan'], @c.create_team('Milan'))
  end

  it 'can add someone to a team' do
    assert_equal([:player_added, { :player => 'Ramsey', :team => 'Arsenal' } ],
                 @c.add_player('Ramsey', 'Arsenal'))
  end

  it 'will not add someone to a non-existent team' do
    assert_equal([:error, :error_type => NonExistentTeamError, :player => 'Ramsey', :team => 'Turnips' ],
                 @c.add_player('Ramsey', 'Turnips'))
    end

  it 'can remove a player' do
    assert_equal([:player_added, { :player => 'Ramsey', :team => 'Arsenal' } ],
                 @c.add_player('Ramsey', 'Arsenal'))
    assert_equal([:player_removed, { :player => 'Ramsey', :team => 'Arsenal' } ],
                 @c.remove_player('Ramsey', 'Arsenal'))
  end

  it 'can show all the team names' do
    @c.create_team('Chelsea')
    @c.create_team('Man City')
    assert_equal([:show_all_teams, {:teams => ['Arsenal', 'Chelsea', 'Man City']}],
                 @c.show_all_teams )
  end

  it 'can show what team a player is on' do
    @c.add_player('Sagna', 'Arsenal')
    assert_equal([:show_player_team, { :player => 'Sagna', :team => 'Arsenal' } ],
               @c.find_team_by_player('Sagna'))
    
  end

  it 'can delete a team' do
    assert_equal([:team_deleted, :team => 'Arsenal'], @c.delete_team('Arsenal'))
  end

  it 'can reset the league' do
    assert_equal([:league_reset, { }], @c.reset_league)
  end
  
end
