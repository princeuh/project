class SystemLog < ApplicationRecord
	#list according to most recent activity
	default_scope -> { order(created_at: :desc) }
end
