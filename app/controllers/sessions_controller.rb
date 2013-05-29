# encoding: UTF-8
class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to root_url, :alert => "Užívateľ je už prihlásený"
    end
	end

	def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
    	session[:user_id] = user.id
      session[:user_name] = user.first_name + " " + user.last_name
      session[:user_rights] = Group.get_rights(user.group)
      # puts session[:user_rights]
      user.last_login=Time.now
      user.save
    	redirect_to root_url, :notice => "Prihlásenie prebehlo úspešne"
  	else
    	flash.now.alert = "Zlé meno alebo heslo"
    	render "new"
  	end
	end

	def destroy
		session[:user_id] = nil
    session[:user_name] = nil
    session[:user_rights] = nil
		redirect_to root_url, :notice => "Odhlásenie prebehlo úspešne"
	end
end