class TwitterController < ApplicationController

	def index
	end

	def login
		oauth.set_callback_url("http://#{request.host}#{":#{request.port}" unless request.port == 80}/twitter/finalize")

		session[:request_token] = oauth.request_token.token
		session[:request_secret] = oauth.request_token.secret

		redirect_url = oauth.request_token.authorize_url
		redirect_url = "http://" + redirect_url unless redirect_url.match(/^http:\/\//)
		redirect_to redirect_url
	end

	def finalize
		oauth.authorize_from_request(session[:request_token], session[:request_secret], params[:oauth_verifier])

		@profile = Twitter::Base.new(oauth).verify_credentials
		session[:request_token] = nil
		session[:request_secret] = nil
		@auth_token = session[:auth_token] = oauth.access_token.token
		session[:auth_secret] = oauth.access_token.secret

	end

	private

	def oauth
		@oauth ||= Twitter::OAuth.new(APP_CONFIG[:twitter][:consumer_key], APP_CONFIG[:twitter][:consumer_secret])
	end

	def client
		oauth.authorize_from_access(session[:auth_token], session[:auth_secret])
		Twitter::Base.new(oauth)

end
