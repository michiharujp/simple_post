class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :micropost
  validates :content, presence: true
end
