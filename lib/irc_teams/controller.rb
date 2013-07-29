class Controller

  attr_reader :teams
  def initialize(view)
    @teams = {}
    @view = view
  end

  def create_team(team_name)
    if @teams[team_name]
      @view.show(:create_existing_team_err, team_name)
    else
      t = Team.new(team_name)
      @teams[team_name] = t
      @view.show(:team_created, team_name)
    end
  end

  def add_player(player, team_name)
    team = @teams[team_name]
    raise "no team named #{ team_name}" unless team
    team.add(player)
  end
end
