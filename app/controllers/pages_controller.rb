class PagesController < ApplicationController


  def create_user
    new_user = User.new
    new_user.email = params[:email]
    new_user.password = params[:password]
    new_user.first_name = params[:first_name]
    new_user.last_name = params[:last_name]

    if new_user.save
      render :index
    else
      redirect '/new'
    end
  end

  def new_card_form
    render :new_card_form
  end


end
