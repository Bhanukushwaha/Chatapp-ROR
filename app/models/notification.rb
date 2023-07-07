class Notification < ApplicationRecord
	belongs_to :user	
	belongs_to :receiver, :foreign_key => "receiver_id", :class_name => "User"
end
