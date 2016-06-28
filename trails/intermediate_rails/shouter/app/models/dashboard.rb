class Dashboard

	def initialize current_user
		@user = current_user
	end

	def new_text_shout
		TextShout.new
	end

	def new_photo_shout
		PhotoShout.new
	end

	def timeline
		Timeline.new(@user)
	end

end
