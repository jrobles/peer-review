class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	helper_method :current_user
	helper_method :client
	helper_method :avatar
 
  	private
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def client
	@client = Octokit::Client.new(:access_token => session[:at])
  end

  def avatar
	@avatar = session[:user_avatar]
  end

end
