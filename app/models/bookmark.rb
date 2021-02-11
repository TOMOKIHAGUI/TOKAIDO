class Bookmark < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  validates_uniqueness_of :post_id, scope: :user_id
  validates :user_id, :post_id, presence: true

end
