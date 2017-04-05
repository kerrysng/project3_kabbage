class Api::CardsController < ApplicationController

  def index
    render json: Card.all
  end

  def create
    card = Card.new
    card.image_url = params[:image_url]
    card.lat = params[:lat].to_f
    card.long = params[:long].to_f
    card.body = params[:body]
    card.user_id = session[:id]
    card.trip_id = params[:trip_id]
    card.country = params[:country]
    card.city = params[:city]

    if card.save
      redirect_to '/trip/'+params[:trip_id]
    else
      redirect_to '/new_card_form/'+params[:trip_id]
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
