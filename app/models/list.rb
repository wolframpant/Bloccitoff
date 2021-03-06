# each user has multiple lists; each list has multiple "todos""

class List < ActiveRecord::Base

  belongs_to :user
  
  has_many :todos, dependent: :destroy

  validates :title, presence: true
  
  validates :cutoff, presence: true

  default_scope { order('created_at DESC') }
 
end
