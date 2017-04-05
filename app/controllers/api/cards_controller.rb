class Api::CardsController < ApplicationController

  def index
    if params[:user_id]
      render json: Card.where(user_id: params[:user_id])
    elsif params[:city]
      render json: Card.where(city: params[:city])
    elsif params[:country]
      render json: Card.where(country: params[:country])
    else
      render json: Card.all
  end

  def create
    card = Card.new
    card.image_url = params[:image_url]
    card.lat = params[:lat].to_f
    card.long = params[:long].to_f
    card.body = params[:body]
    card.user_id = session[:id]
    card.trip_id = 3
    card.country = params[:country]
    card.city = params[:city]

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
