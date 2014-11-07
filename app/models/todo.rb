class Todo < ActiveRecord::Base

  belongs_to :user

  validates :description, presence: true

  default_scope { order('created_at DESC') }

  def age_of_todo
    (((created_at + 7.days) - Time.now)/(60*60*24)).round
  end

  
end
