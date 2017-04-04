class SessionController < ApplicationController

  def create_session
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:first_name] = user.first_name
      redirect_to '/'
    else
      render :index
    end
  end

  def destroy_session
    session[:first_name] = nil
    redirect_to '/'
  end

end
