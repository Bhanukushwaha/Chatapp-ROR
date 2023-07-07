module RoomsHelper

	def check_count_message(receiver_id, current_user_id)
		notification = Notification.where(user_id:receiver_id, receiver_id: current_user_id, is_read: false)
		if notification.present?
			return notification.count
		else
			return ""
		end
		
	end

	def find_notification(receiver_id, current_user_id)
		notification = Notification.where(user_id:receiver_id, receiver_id: current_user_id, is_read: false)
		return notification.map(&:id)
	end
end
