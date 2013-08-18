class AlbumsController < ApplicationController
  
  before_filter :authenticate_user! , :except => [:show, :index]
  load_and_authorize_resource
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  # before_filter :auth_user

  # def auth_user
  #   redirect_to new_user_session_url unless user_signed_in?
  # end

  # GET /albums
  # GET /albums.json
  def index
       @albums =  Album.find_all_by_user_id(current_user.id)
      #@albums = current_user.albums.load  This is the alternate way for it
      # @albums = Album.all
      # puts @albums
      # die
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
      # authorize! :read, @album
  end

  # GET /albums/new
  def new
    @album = current_user.albums.build
    # @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    @album.user = current_user
    @album = current_user.albums.build(album_params)

    respond_to do |format|
      if @album.save
        #send email notifications
        AlbumMailer.notify_user(@album).deliver 
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render action: 'show', status: :created, location: @album }
      else
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album ||= Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title)
    end
end
