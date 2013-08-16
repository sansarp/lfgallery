class SupportsController < ApplicationController
	def new
		@support = Support.new
	end

	def create
		# @support.notify(params)
		SupportMailer.notify(params[:support]).deliver
		redirect_to new_support_path, notice: "We will contact asp"
	end
end