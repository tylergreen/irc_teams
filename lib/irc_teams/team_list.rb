class TeamList

  attr_reader :teams
  def initialize
    @teams = {}
  end

  def create_team(team_name)
    raise "Team #{ team_name } already exists" if @teams[team_name]
    @teams[team_name] = Team.new(team_name)
  end

  def find_team(team_name)
    @teams[team_name] or raise "no team named #{ team_name}"
  end

  def add_player(player, team_name)
    team = find_team(team_name)
    raise "player already on #{ team_name }" if team.include?(player)
    team.add(player)
  end

  def remove_player(player, team_name)
    team = @teams[team_name]
    raise "no team named #{ team_name}" unless team
    team.delete(player)
  end

  def find_team_by_player(player)
    @teams.values.find{ |t| t.include?(player) }
  end

  def remove_team(team_name)
    @teams.delete(team_name)
  end
end
