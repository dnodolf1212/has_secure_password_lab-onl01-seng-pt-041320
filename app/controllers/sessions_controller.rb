class SessionsController < ApplicationController
  protect_from_forgery prepend: true

  def new
    
  end

  def create
    #binding.pry
   @user = User.find_by(name: params[:user][:name])
    if @user == nil
    redirect_to 'new'
   else
  
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path(@user)
   end
  end

  def destroy
    session.delete :name

  end
end
