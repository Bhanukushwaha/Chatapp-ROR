class Message < ApplicationRecord
  default_scope { order(created_at: :asc) }
  belongs_to :user
  belongs_to :room
  has_many :notifications
  after_create_commit { broadcast_append_to self.room }
  attr_accessor :receiver_id
end
