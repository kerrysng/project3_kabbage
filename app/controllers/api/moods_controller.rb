class Api::MoodsController < ApplicationController

  def create
    mood = Mood.new
    mood.user_id = session[:id]
    mood.card_id = params[:card_id]
    mood.save

    redirect_to '/'
  end

  def show
    array = [];
    mood = Mood.where(user_id: session[:id])
    mood.each do |mood|
      array << mood.card
    end
    render json: array
  end


end
