require 'irc_teams/team'

class League

  attr_reader :teams
  def initialize
    @teams = {}
  end

  def create_team(team_name)
    raise TeamAlreadyExistsError, "Team #{ team_name } already exists" if @teams[team_name]
    @teams[team_name] = Team.new(team_name)
  end

  def find_team(team_name)
    @teams[team_name] or raise NonExistentTeamError, "no team named #{ team_name}"
  end

  def add_player(player, team_name)
    raise LeagueError, "player already on #{ team_name }" if find_team_by_player(player)
    find_team(team_name).add(player)
  end

  def remove_player(player, team_name)
    team1 = find_team(team_name)
    team2 = find_team_by_player(player)
    raise NonExistentPlayerError, "No such player #{player}" unless team2
    raise NotOnTeamError, "player #{ player } is not on team #{ team_name}" unless team1 == team2
    team2.delete(player)
  end

  def find_team_by_player(player)
    @teams.values.find{ |t| t.include?(player) }
  end

  def remove_team(team_name)
    raise NonExistentTeamError unless @teams[team_name]
    @teams.delete(team_name)
  end
end

class LeagueError < StandardError ; end
class NonExistentTeamError < LeagueError ; end
class NonExistentPlayerError < LeagueError ; end
class NotOnTeamError < LeagueError ; end
class TeamAlreadyExistsError < LeagueError ; end

