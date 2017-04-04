<<<<<<< HEAD
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

=======
class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])

        session[:user_id] = user.id
        redirect_to '/'

      else
        render :new
      end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'

  end
>>>>>>> 1173d87f63a3fb5985cd438f83ddca8da5145f43
end
