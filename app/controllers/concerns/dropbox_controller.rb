require 'dropbox_sdk'
class DropboxController < ApplicationController

	def authenticate
		@authorization_url = flow.start()
	end

	def callback
		access_token, user_id = flow.finish(params[:code])
		current_user.dropbox_token = access_token
		redirect_to items_path
	end

	def upload
		file = open(params[:file].tempfile)
		response = client.put_file('/test_file.txt', file)
		puts "uploaded:", response.inspect 
		redirect_to items_path
	end	

	def upload_file
	end

	private
	
	def client
		@client ||= DropboxClient.new(current_user.dropbox_token)
	end

	def flow
		key = Rails.application.secrets.dropbox_key
		secret = Rails.application.secrets.dropbox_secret
		flow = DropboxOAuth2FlowNoRedirect.new(key, secret)
	end

end