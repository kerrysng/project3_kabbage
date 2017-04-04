class Api::CardsController < ApplicationController

  def index
    render json: Card.all
  end



  def create
    card = Card.new
    # geolocation goes here?
    card.long = params[:long]
    card.lat = params[:lat]
    card.body = params[:body]
    card_image = params[:image_url]
    if card.save
      redirect_to '/'
    else
      redirect_to '/new_card_form'
    end
  end


  def destroy
    card = Card.find(params[:id])
    if card.destroy
      render json: card
    else
      render json: card.errors
    end
  end


  def edit
    card = Card.find(params[:id])
    if card
      render json: card
    else
      render json: card.errors
    end
  end



  def update
    card = Card.find(params[:id])

    card.body = params[:body]
    card_image = params[:image_url]
    if card.save
      render json: Card.all
    else
      render json: card.errors
    end

  end



end
