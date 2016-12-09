class ViagersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_viager, only: [ :show, :edit, :update, :destroy ]
  def index
    @viagers = Viager.all
  end

  def new
  end

  def show

    @viager_coordinates = { lat: @viager.latitude, lng: @viager.longitude }

    @hash = Gmaps4rails.build_markers(@viager) do |viager, marker|
      marker.lat viager.latitude
      marker.lng viager.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end


  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

   private

  def set_viager
    @viager = Viager.find(params[:id])
  end

end
