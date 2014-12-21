class Todo < ActiveRecord::Base

  belongs_to :list

  validates :description, presence: true

  default_scope { order('created_at DESC') }

  def age_of_todo
    ((Time.now - created_at) / (60*60*24)).round
  end
  
end
