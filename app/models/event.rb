class Event < ActiveRecord::Base
validates :date, presence: true
validates :club_id, presence: true

def club
  Club.find(self.club_id)
end
def passes
  Pass.where(:event_id=>self.id)
end
def requests
  Request.where(:event_id=>self.id)
end

def users_with_passes
  User.where(:id=>self.passes.pluck(:user_id))
end
def users_with_requests
  User.where(:id=>self.requests.pluck(:user_id))
end
def details
  return "#{club.name} on #{date}"
end
end
