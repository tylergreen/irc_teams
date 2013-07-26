require "test/unit"
require 'irc_teams/commands'
include Commands

describe Commands do
  it 'has a create team command' do
    assert_match(CreateTeam, "create team PSG ")
    assert_match(CreateTeam, "create team arsenal")
    assert_match(CreateTeam, " create team ##@**~Super733t~**@## ")
  end

  it 'has a join team command' do
    assert_match(JoinTeam, "join PSG")
    assert_match(JoinTeam, "  join arsenal  ")
    assert_match(JoinTeam, "join ##@**~Super733t~**@##     ")
  end

  it 'has a leave team command' do
    assert_match(LeaveTeam, "leave team")
  end

  it 'has a show teams command' do
    assert_match(ShowAllTeams, 'show teams')
  end

  it 'has a show specfic team command' do
    assert_match(ShowTeam, 'show team PSG')
    assert_match(ShowTeam, ' show team arsenal ')
    assert_match(ShowTeam, "show team ##@**~Super733t~**@##     ")
  end

  it 'has a show my team command' do
    assert_match(ShowMyTeam, 'show my team')
    assert_match(ShowMyTeam, ' show my team  ')
  end

  it 'has a delete team command' do
    assert_match(DeleteTeam, 'delete team PSG')
    assert_match(DeleteTeam, 'delete team ##@**~Super733t~**@##    ')
  end
  
end
