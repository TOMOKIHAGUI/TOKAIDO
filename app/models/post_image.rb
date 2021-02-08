class PostImage < ApplicationRecord

  validates :post_id, :image_id, presence: true

  belongs_to :post
  attachment :image
end
