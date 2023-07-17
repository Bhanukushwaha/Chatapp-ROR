class Post < ApplicationRecord
 belongs_to :user
 has_one_attached :image
 has_many :comments, dependent: :destroy
 has_many :likes, dependent: :destroy
 validates :title, presence: true
 default_scope {order('created_at DESC')}
end
