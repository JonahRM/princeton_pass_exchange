class Club < ActiveRecord::Base
validates :name, presence: true
  def users
    User.where(:club_id=>self.id)
  end
  def events
    Event.where(:club_id=>self.id)
  end
  def passes
    Pass.where(:event_id=>events.pluck(:id))
  end
  def requests
    Request.where(:event_id=>events.pluck(:id))
  end
  def officers
    self.users.where(:officer=>true)
  end
end
