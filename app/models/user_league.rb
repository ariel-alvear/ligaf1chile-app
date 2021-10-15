class UserLeague < ApplicationRecord
  belongs_to :user
  belongs_to :league

  before_save :check_for_identical_record

  def check_for_identical_record
    if UserLeague.exists?(user_id: self.user_id, league_id: self.league_id)
      raise Exception.new('Participantes duplicados!')
    else
      true
    end
  end
end
