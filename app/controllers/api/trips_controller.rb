class Api::TripsController < ApplicationController

  def index
    render json: Trip.all

  end

  def new
    @user = current_user
  end

  def create
    trip = Trip.new
    trip.start_date = params[:start_date]
    trip.end_date = params[:end_date]
    trip.name = params[:name]

    if trip.save
      render json: trip

    else
      render json: trip.errors

    end
  end

  def destroy
    card = Trip.find(params[:name])
    if trip.destroy
      render json: trip
    else
      render json: trip.errors

    end
  end

  def edit
    card = Trip.find(params[:name])

  end
end
