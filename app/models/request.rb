class Request < ActiveRecord::Base
validates :event_id, presence: true
validates :user_id, presence: true
validates :quantity, presence: true

def user
  User.find(self.user_id)
end
def event
  Event.find(self.event_id)
end
def club
  Club.find(self.event.club_id)
end

end

