class PhotoShoutsController < ApplicationController
	include Concerns::CreateShouts
	
	private

	def build_content
		PhotoShout.new(photo_shout_parameters)
	end


	def photo_shout_parameters
		params.require(:photo_shout).permit(:image)
	end

end

