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
    @viager = Viager.new(viager_params)

    if @viager.save


      @viager.number_share.times do
        RenteShare.create(viager_id: @viager.id, assign: false, valeur: (@viager.rente/@viager.number_share))
        BouquetShare.create(viager_id: @viager.id, assign: false, valeur: (@viager.bouquet/@viager.number_share))

      end


      flash[:notice] = "Hop un nouveau viager dans la besace"
      redirect_to pages_old_path(@viager, id: @viager.id)
    else
      redirect_to pages_admin_path
    end
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

  def viager_params
    params.require(:viager).permit(:address, :city, :zip_code, :country, :old_id, :photo, :photo_cache,
              :rente, :bouquet, :horizon, :tri, :habitable, :piece,
              :niveaux, :ascenceur, :balcon, :annee, :terrain, :annexe, :maison,
              :venale, :decote, :number_share, :salon , :salon_cache, :chambre, :chambre_cache, :exterieur)
  end


end
