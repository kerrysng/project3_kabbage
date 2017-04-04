class CardsController < ApplicationController
  def new
  end

  def index
    @cards = Card.all

  end

  def show
    @cards = Card.find_by(params[:id])
  end

  def create
    card = Card.new
    card.body = params[:body]
    card.image_url = params[:image_url]

    if card.save
      redirect_to '/cards'

    else
      render :new
    end

  end

  def destroy
    dish = Card.find(params[:dish_id])
    if card.destroy
      redirect_to '/cards'
    else
      render :index
   end
 end


end
