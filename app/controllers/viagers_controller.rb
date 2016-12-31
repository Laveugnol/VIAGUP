require 'open-uri'
require 'nokogiri'
require "json"
require "rest-client"

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

    ville = @viager.city.downcase
    zip = @viager.zip_code
    meilleur_agent_scrap(ville, zip)


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

  def meilleur_agent_scrap(ville, zip)
    address = "https://www.meilleursagents.com/prix-immobilier/#{ville}-#{zip}/"
    html_file = open(address)
    html_doc = Nokogiri::HTML(html_file)

    a = html_doc.search('.prices-summary__cell--median').text
    prix_m2_moyens = a.scan(/\d.\d+/)
    @prix_m2_moyen_maison = prix_m2_moyens[0]
    @prix_m2_moyen_appartement = prix_m2_moyens[1]


    b = html_doc.search('.market-value').text
    @evolution_des_prix_sur_annee = b.match(/.\d.\d+../)[0]
    @delai_vente_moyen = b.match(/....[jours]+/)[0]

    c = html_doc.search('.local-stats-table').text
    @population = c.match(/.....\d.\d+\s[habitants]+/)[0]
    @croissance = c.scan(/..\d.\d+\s./)[1]
    @nbre_logement = c.match(/........\d+\s[logements]+/)[0]
    @densité = c.match(/...\d+\s[hab]+.\s.\s[km]+./)[0]
  end

  def code_postal(ville)

    a = 'https://datanova.legroupe.laposte.fr/api/records/1.0/search/?dataset=laposte_hexasmal&q='+ville+ '&facet=code_postal'
    b = RestClient.get a
    c = JSON.parse(b)
    zip =c["records"][0]["fields"]["code_postal"]
  end


end
