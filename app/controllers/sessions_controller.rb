class SessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.find(params[:room_id])
  end

  def new
    @room = Room.find(params[:room_id])
    @session = Session.new
    @movies = Movie.all
  end
end