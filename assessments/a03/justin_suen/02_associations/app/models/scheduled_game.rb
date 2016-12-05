# == Schema Information
#
# Table name: scheduled_games
#
#  id             :integer          not null, primary key
#  home_team_id   :integer          not null
#  away_team_id   :integer          not null
#  scheduled_date :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ScheduledGame < ActiveRecord::Base
  belongs_to :home_team,
    primary_key: :id,
    foreign_key: :home_team_id,
    class_name: "Team"

  belongs_to :away_team,
    primary_key: :id,
    foreign_key: :away_team_id,
    class_name: "Team"
end
