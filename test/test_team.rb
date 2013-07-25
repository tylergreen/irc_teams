require "test/unit"
require 'irc_teams/team'

describe Team do
  it 'has a name' do
    t = Team.new('psg')
    assert_equal(t.name, 'psg')
  end
    
  it 'can add a player' do
    t = Team.new('test team')
    t.add('Thiago')
    assert_includes(t, 'Thiago')
  end

  it 'can remove a player' do
    t = Team.new('psg')
    t.add('Thiago')
    t.add('Ibra')
    t.delete('Thiago')
    assert(t.include?('Ibra'))
    assert(not(t.include?('Thiago')))
  end
end
