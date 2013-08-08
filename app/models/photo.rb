class Photo < ActiveRecord::Base
	attr_accessible :album_id, :title, :photo
  	belongs_to :album
  	mount_uploader :photo, PhotoUploader
end
