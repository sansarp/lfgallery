class SupportMailer < ActionMailer::Base
  default from: "from@example.com"

  def notify(params)
  	mail(to: 'connect.subash@gmail.com', subject: params[:subject],
  		body: params[:message]
  		)
	end
end
