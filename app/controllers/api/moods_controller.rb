class MoodsController < ApplicationController

  def index
    @moods = Mood.all

  end

  def show
  end

  def new
    @mood = current_user.moods.build

  end

  def edit
    
  end

  def create
    @mood = current_user.moods.build(mood_params)
    if @mood.save
      redirect_to @mood
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @mood.destroy
    redirect_to moods_url
  end



  def mood_params
    params.permit(:card_id, :trip_id)
  end







end
