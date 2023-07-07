class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :send_requests, :foreign_key => "sender_id", :class_name => "Friend" , dependent: :destroy
  has_many :receive_requests, :foreign_key => "receiver_id", :class_name => "Friend", dependent: :destroy
  has_many :notifications, :foreign_key => "receiver_id", :class_name => "Notification", dependent: :destroy
  validates_uniqueness_of :username, :case_sensitive => false
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  has_many :messages, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def status
    return 'online_icon offline' if last_request_at.nil?
    DateTime.now.to_time - last_request_at.to_time > 10 ? 'online_icon offline' : 'online_icon'
  end
  def is_online
    return 'offline' if last_request_at.nil?
    DateTime.now.to_time - last_request_at.to_time > 10 ? 'offline' : 'online'
  end

  def check_for_time
    # if last_request_at + 24.hours < DateTime.now
    #   return 'yestarday'
    # elsif last_request_at + 48.hours < DateTime.now
    #     return last_request_at.strftime("%I:%M %p %d")
    # else
    #   return last_request_at.strftime("%I:%M %p ")
    # end

    return last_request_at.strftime("%D %I: %M %p")
  end
end
