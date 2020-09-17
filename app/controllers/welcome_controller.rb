class WelcomeController < ApplicationController

  def home
    if @user
    @user = User.find_by(name: params[:name])
    render :home
    end
  end

end
