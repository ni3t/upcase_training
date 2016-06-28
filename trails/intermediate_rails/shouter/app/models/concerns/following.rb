module Concerns
	module Following
		extend ActiveSupport::Concern
		
		included do	
			has_many :follower_relationships, 
				foreign_key: :followed_user_id, 
				class_name: 'FollowingRelationship'
			has_many :followers, 
				through: :follower_relationships 
			has_many :followed_users, 
				through: :followed_user_relationships
			has_many :followed_user_relationships, 
				foreign_key: :follower_id, 
				class_name: 'FollowingRelationship'
		end

		def can_follow? user
			self != user
		end

		def follow other_user
			followed_users << other_user
		end

		def unfollow other_user
			followed_users.delete(other_user)
		end

		def following? other_user
			followed_user_ids.include? other_user.id
		end

	end
end

