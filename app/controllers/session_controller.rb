class SessionController < ApplicationController

  def create_session
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      session[:first_name] = user.first_name
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      redirect_to '/new'
    end
  end

  def destroy_session
    session[:first_name] = nil
    session[:user_id] = nil
    redirect_to '/'
  end

end
