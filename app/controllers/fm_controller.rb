require_relative "../../../football-manager/lib/football_manager"
require_relative "../../../football-manager/spec/factories"

class FmController < ActionController::Base
  def index
    team_1 = Team.new
    team_2 = Team.new
    kicker = Player.new(position: "K", name: "Krzysiek")
    returner = Player.new(position: "KR", name: "Robert")
    center = Player.new(position: "C", name: "Cezary")
    qb = Player.new(position: "QB", name: "Qba")
    roster_1 = Roster.new(team: team_1, kicker: kicker)
    roster_2 = Roster.new(team: team_2, returner: returner, center: center, qb: qb)

    action_generator = Factory.new.default_action_generator
    match_generator = MatchGenerator.new(action_generator: action_generator, home_roster: roster_1, away_roster: roster_2)

    match_generator.generate_whole
    @match = match_generator.match
  end
end
