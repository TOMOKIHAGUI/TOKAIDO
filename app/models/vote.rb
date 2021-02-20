class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :user_id
  validates :user_id, :post_id, presence: true

  enum detail:{
    unknown:0, have_heard:1, have_been:2, famous:3
  }

end
