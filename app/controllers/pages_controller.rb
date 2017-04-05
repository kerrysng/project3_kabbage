class PagesController < ApplicationController


  def index
    #make search case independent
    #search = params[:search]
    #selected = params[:select]
    #if search != nil && search != ''
      #@cards = Card.where("#{selected}": search)
      #render json: @cards
      render :index
    #else
      #@cards = Card.all
      #render json: @cards
    #end
  end

  def create_user
    new_user = User.news
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

  def dashboard
    @cards = Card.where(id: session[:user_id])
    render :dashboard
  end


end
