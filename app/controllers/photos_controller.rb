class PhotosController < ApplicationController

  #load_and_authorize_resource

  def index
  end

   def new
  	@album = Album.find params[:album_id]
  	@photo = Photo.new
  end

  def create
  	@album = Album.find params[:album_id]
  	@photo = @album.photos.build(photo_params)
  	if @photo.save
  		# redirect_to album_photo_path(@album, @photo), notice: 'Photo Added'
      redirect_to photo_path(@photo), notice: 'Photo added'
  	else
  		render :new
  	end
  end

  def show
  	#@albums = Album.find params[:album_id]
  	@photos = Photo.find params[:id]
    #binding.pry
    #@photo = Photo.find(params[:id])
  end

  def edit
      @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to photo_path(@photo), notice: 'Photo Updated'
    else
      render :edit
    end 
  end

  private 
  def photo_params
  	params.require(:photo).permit(:caption, :description, :photo, :category_ids => [])
  end

end
