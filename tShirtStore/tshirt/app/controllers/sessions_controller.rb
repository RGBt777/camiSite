class SessionsController < ApplicationController
skip_before_action :authorize

  def new
  end

  def create
  user = Customer.find_by_username(params[:name])
  if user and user.authenticate(params[:password])
  session[:user_id] = user.id
  
  # Initialize new arrays for product and quantity. 
	session[:cart_prod] = Array.new
	session[:cart_qty] = Array.new


  
  redirect_to root_url, :notice => "Logged in!"
  else
  flash.now.alert = "Invalid username or password"
  render "new"
  end
  end

  def destroy
  session[:user_id] = nil
  
# Initialize new arrays for product and quantity. 
session[:cart_prod] = Array.new
session[:cart_qty] = Array.new

  
  redirect_to login_url, :notice => "Logged out!"
  end
end
