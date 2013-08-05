class Album < ActiveRecord::Base
	#validates :title, presence: true
	belongs_to :user
	validates :title, presence: true
	#validate :title, (:presence=> true)

	has_many :albums
end
