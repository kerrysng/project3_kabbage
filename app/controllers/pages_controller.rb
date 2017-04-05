class PagesController < ApplicationController

  def index
    search = params[:search]
    selected = params[:select]
    if search != nil && search != ''
      @results = Card.where("#{selected}": search)
      render :index
    else
      @results = []
    end
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

  def mood_board
    render :mood_board
  end

  def trip_view
    @cards = Card.all
    render :trip_view
  end


end
