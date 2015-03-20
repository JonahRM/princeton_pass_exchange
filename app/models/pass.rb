class Pass < ActiveRecord::Base
validates :event_id, presence: true
validates :user_id, presence: true
validates :quantity, presence: true

def owner
  User.find(self.user_id)
end
def event
  Event.find(self.event_id)
end
def club
  Club.find(self.event.club_id)
end
  def events_they_want(user_who_wants_pass)
    events_they_want=Event.where(:id=>self.owner.requests.pluck(:event_id))
    events_you_have=user_who_wants_pass.events_held
    events_you_have_they_want=Array.new
    events_they_want.each do |event|
      if events_you_have.include?(event)
        events_you_have_they_want.push(event)
      end
      end
    return events_you_have_they_want
    end

end
