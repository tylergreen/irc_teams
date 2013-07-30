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

end
