class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :have_right
  before_filter :set_start_time

  private
	def current_user
    @current_user ||= session[:user_id] if session[:user_id]
  end
  def set_start_time
    @start_time = Time.now.usec
  end

  def have_right(name)
    sha_name = Digest::SHA1.hexdigest(name)
    unless  session[:user_rights]
      return false
    else
      return session[:user_rights].include?(sha_name)
    end
  end
end
