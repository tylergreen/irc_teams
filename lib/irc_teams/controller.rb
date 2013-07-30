class Controller

  def initialize(view)
    @league = League.new
    @view = view
  end

  def create_team(team_name)
    begin
      @league.create_team(team_name)
    rescue LeagueError
      @view.show(:create_team_error, :team => team_name)
    else
      @view.show(:team_created, :team => team_name)
    end
  end

  def add_player(player, team_name)
    begin
      bindings = { :player => player, :team => team_name }
      @league.add_player(player, team_name)
    rescue NonExistentTeamError
      @view.show(:non_existent_team_error, bindings)
    rescue LeagueError
      @view.show(:player_already_on_team_error, bindings)
    else
      @view.show(:player_added, bindings)
    end
  end

  def remove_player(player, team_name)
    begin
      bindings = { :player => player, :team => team_name }
      @league.remove_player(player, team_name)
    rescue NonExistentTeamError
      @view.show(:non_existent_team_error, bindings)
    rescue NonExistentPlayerError
      @view.show(:non_existent_player_error, bindings)
    rescue NotOnTeamError
      @view.show(:not_on_team_error, bindings)
    else
      @view.show(:player_removed, bindings)
    end
  end

  def show_all_teams
    @view.show(:show_all_teams, :teams => @league.teams.keys)
  end

  def find_team_by_player(player)
    begin
      team = @league.find_team_by_player(player)
    rescue LeagueError => e
      @view.show(:error, :error_class => e.class, :player => player)
    else
      @view.show(:show_player_team, :player => player, :team => team.name)
    end
  end

  def delete_team(team)
    begin
      @league.remove_team(team)
    rescue LeagueError => e
      @view.show(:err, :error_type => e.class, :team => team)
    else
      @view.show(:team_deleted, :team => team)
    end
  end

  def reset_league
    @league = League.new
    @view.show(:league_reset, { })
  end
  
end
