class Album < ActiveRecord::Base
	#validates :title, presence: true
	belongs_to :user
	has_many :photos
	validates :title, presence: true
	#validate :title, (:presence=> true)	
	before_save :uppercase_title

	def uppercase_title
		self.title = self.title.capitalize
	end
end
