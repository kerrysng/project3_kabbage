class Api::CardsController < ApplicationController

  def create
    card = Card.new
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

end
