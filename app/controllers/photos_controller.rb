class PhotosController < ApplicationController
   def new
  	@album = Album.find params[:album_id]
  	@photo = Photo.new
  end

  def create
  	@album = Album.find params[:album_id]
  	@photo = @album.photos.build(photo_params)
  	if @photo.save
  		redirect_to album_photo_path(@album, @photo), notice: 'Photo Added'
  	else
  		render :new
  	end
  end

  def show
  	@albums = Album.find params[:album_id]
  	@photos = Photo.find params[:id]
  end

  private 
  def photo_params
  	params.require(:photo).permit(:caption, :description, :photo)
  end

end
