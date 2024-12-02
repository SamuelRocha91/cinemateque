class SessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.find(params[:room_id])
  end
end