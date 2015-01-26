#these are the actual items in a user's lists

class Todo < ActiveRecord::Base

  belongs_to :list

  validates :description, presence: true

  default_scope { order('created_at DESC') }

 #each todo is deleted when it's older than the number of days selected by the user as a list's "cutoff"
  def age_of_todo
    ((Time.now - created_at) / (60*60*24)).round
  end
  
end
