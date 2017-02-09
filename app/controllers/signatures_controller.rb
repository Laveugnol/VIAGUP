require "json"
require "rest-client"

class SignaturesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:callbacks]
  skip_before_action :verify_authenticity_token, only: [:callbacks]
  before_action :set_viager, only: [:reservation]

  def callbacks

    render json: 'Hello API Event Received', status: 200

  end

  def new
  end


  def create
    embedded_request = create_embedded_request(name: params[:name], email: params[:email])
    @sign_url = get_sign_url(embedded_request)
    render :embedded_signature

  end

  def reservation


    embedded_request = create_embedded_request_resa(name: current_user.investment_profile.nom,
                                                    email: current_user.email,
                                                    part: params[:part])
    @sign_url = get_sign_url(embedded_request)

    @user = current_user
    @parts = params[:part]
    current_user.investment_profile.essai = @parts
    current_user.investment_profile.product = @viager.id.to_i
    current_user.save
    current_user.investment_profile.save

    render :embedded_subscription
    # redirect_to viagers_souscription_path(@viager, @sign_url)
  end





  private

  def create_embedded_request(opts = {})

    client = HelloSign::Client.new :api_key => ENV["HELLO_SIGN"]

    client.create_embedded_signature_request_with_template(
      :test_mode => 1,
      :client_id => ENV["HELLO_SIGN_CLIENT"],
      :template_id => '4e2d6bd8e88f147396646c26597e35f894ce08e0',
      :subject => 'Signature du profil investisseur',
      :message => 'Bienvenue votre espace de signature sécurisé',
      :signers => [
          {
              :email_address => opts[:email],
              :name => opts[:name],
              :role => 'Client'

          },

      ],

      :custom_fields => {
        :civilite => current_user.investment_profile.civilite,
        :nom => current_user.investment_profile.nom,
        :prenom => current_user.investment_profile.prenom,
        :birth_date => current_user.investment_profile.birth_date.strftime("%d/%m/%Y"),
        :birth_place => current_user.investment_profile.birth_place,
        :ville => current_user.investment_profile.ville,
        :postal => current_user.investment_profile.code_postal,
        :profession => current_user.investment_profile.categoriesp + "," + current_user.investment_profile.expertise,
        :nationalite => current_user.investment_profile.nationalite,
        :adresse => current_user.investment_profile.adresse,
        :courriel => current_user.email,
        :pays => current_user.investment_profile.country,
        :tel => current_user.investment_profile.mobile,
        :Q1 => current_user.investment_profile.invest3,
        :Q2 => current_user.investment_profile.invest4,
        :Q3 => current_user.investment_profile.patrimoine3,
        :Q4 => current_user.investment_profile.patrimoine2,
        :Q5 => current_user.investment_profile.patrimoine1,
        :Q6 => current_user.investment_profile.blanchiement1,
        :Q7 => current_user.investment_profile.blanchiement2,
        :Q8 => current_user.investment_profile.invest1


      }
    )

  end


  def create_embedded_request_resa(opts = {})
    client = HelloSign::Client.new :api_key => ENV["HELLO_SIGN"]

    client.create_embedded_signature_request_with_template(
      :test_mode => 1,
      :client_id => ENV["HELLO_SIGN_CLIENT"],
      :template_id => 'ffb427c11d7275b335418ffb39212df0169cea55',
      :subject => 'Réservation de parts de SCI ',
      :message => "Bienvenue au sein de la communauté VIAG'UP",
      :signers => [
          {
              :email_address => opts[:email],
              :name => opts[:name],
              :role => 'Client'

          },

      ],

      :custom_fields => {
        :viager_address => @viager.address,
        :viager_city => + ' ' +@viager.city,
        :viager_zip_code => + ', ' +@viager.zip_code,
        :nom => current_user.investment_profile.nom,
        :prenom => current_user.investment_profile.prenom,
        :birth_place => current_user.investment_profile.birth_place,
        :birth_date => current_user.investment_profile.birth_date,
        :nationality => current_user.investment_profile.nationalite,
        :full_address => current_user.investment_profile.adresse + ',' + current_user.investment_profile.code_postal + ' ' + current_user.investment_profile.ville,
        :share_number=> opts[:part],
        :bouquet_amount => opts[:part].to_i * (@viager.bouquet/@viager.number_share) ,
        :rente_amount => opts[:part].to_i * (@viager.rente/@viager.number_share),
        :city => current_user.investment_profile.ville,
        :birth_date => current_user.investment_profile.birth_date
      }
    )
  end



  def get_sign_url(embedded_request)
    sign_id = get_first_signature_id(embedded_request)
    HelloSign.get_embedded_sign_url(signature_id: sign_id).sign_url
  end

  def get_first_signature_id(embedded_request)
    embedded_request.signatures[0].signature_id
  end

  def set_viager
    @viager = Viager.find(params[:id])
  end

end
