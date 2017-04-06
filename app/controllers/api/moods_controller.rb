class Api::MoodsController < ApplicationController

  def index
    render json: Mood.all
  end

  def create
    mood = Mood.new
    mood.user_id = session[:id]
    mood.card_id = params[:card_id]
    mood.save

    redirect_to '/'
  end








end
