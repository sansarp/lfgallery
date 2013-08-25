class Photo < ActiveRecord::Base
  	belongs_to :album
  	mount_uploader :photo, PhotoUploader
  	has_and_belongs_to_many :categories

def view_categories
	self.categories.map(&:name).join(",")
end
end
