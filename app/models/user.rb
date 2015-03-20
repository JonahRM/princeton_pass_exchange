class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates :name, presence: true

def club
  if self.club_id.present?
    return Club.find(self.club_id).name
  else
    return "No Club"
  end
end
def passes
  Pass.where(:user_id=>self.id)
end
def requests
  Request.where(:user_id=>self.id)
end
def events_held
  Event.where(:id=>passes.pluck(:event_id))
end
def events_requested
  Event.where(:id=>requests.pluck(:event_id))
end
def users_who_have_what_you_want
    this_persons_requested_event_ids= requests.pluck(:event_id)
    passes_that_are_available_with_requests_ids=Pass.where(:event_id=>this_persons_requested_event_ids)
    user_ids_passholders=passes_that_are_available_with_requests_ids.pluck(:user_id)
    User.where(:id=>user_ids_passholders)
  end
  def users_who_want_what_you_have
    requests_for_your_passes=Request.where(:event_id=>passes.pluck(:event_id))
    user_requester_ids=requests_for_your_passes.pluck(:user_id)
    User.where(:id=>user_requester_ids)
  end
  def matches
    array_of_matches=Array.new
    users_who_have_what_you_want.each do |user_who_has_what_you_want|
      if users_who_want_what_you_have.include?(user_who_has_what_you_want)
        array_of_matches=array_of_matches.push(user_who_has_what_you_want)
      end
    end
    return array_of_matches
  end
  def matching_passes
    users_events_requested=events_requested
    array_of_matching_passes=Array.new
    matches.each do |match|
      match.passes.each do |pass|
        if events_requested.pluck(:id).include?(pass.event_id)
          array_of_matching_passes.push(pass)
        end
      end
    end
    return array_of_matching_passes
  end
end


