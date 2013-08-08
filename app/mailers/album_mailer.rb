class AlbumMailer < ActionMailer::Base
  default from: "subashpoudyal@hotmail.com"

  def notify_user(album)
  	@user = album.user
  	@album = album
  	mail(to: @user.email, 
  		subject: 'Album Created',
  		)
	end
end
