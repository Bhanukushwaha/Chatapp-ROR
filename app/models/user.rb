class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :send_requests, :foreign_key => "sender_id", :class_name => "Friend" , dependent: :destroy
  has_many :receive_requests, :foreign_key => "receiver_id", :class_name => "Friend", dependent: :destroy
  validates_uniqueness_of :username, :case_sensitive => false
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  has_many :messages
end