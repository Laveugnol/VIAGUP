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
    raise
    embedded_request = create_embedded_request_resa(name: params[:name],
                                                    email: params[:email],
                                                    part: params[:part])
    @sign_url = get_sign_url(embedded_request)
    @user = current_user

    params[:part].to_i.times do
    end

    render :embedded_signature


  end





  private

  def create_embedded_request(opts = {})

    # HelloSign.create_embedded_signature_request(
    #   test_mode: 1, #Set this to 1 for 'true'. 'false' is 0
    #   client_id: ENV["HELLO_SIGN_CLIENT"],
    #   subject: 'Ca y est ça marche',



    #   message: 'Quelle saloperie!',
    #   signers: [
    #     {
    #       email_address: opts[:email],
    #       name: opts[:name],
    #     }
    #   ],
    #   files: ["#{Rails.root}/documents/youpi.pdf"]

    # )


    client = HelloSign::Client.new :api_key => ENV["HELLO_SIGN"]


    client.create_embedded_signature_request_with_template(
      :test_mode => 1,
      :client_id => ENV["HELLO_SIGN_CLIENT"],
      :template_id => '8a76c9eb3998c1440d359448484dadb9899e2cbf',
      :subject => 'est-ce que ça chemar le create_embedded_signature_request_with_template',
      :message => 'bon alors?',
      :signers => [
          {
              :email_address => opts[:email],
              :name => opts[:name],
              :role => 'Client'

          },

      ],

      :custom_fields => {
        :patrimoine1 => current_user.investment_profile.patrimoine1,
        :invest1=> current_user.investment_profile.invest1
      }
    )

  end

  def create_embedded_request_resa(opts = {})


    client = HelloSign::Client.new :api_key => ENV["HELLO_SIGN"]

    client.create_embedded_signature_request_with_template(
      :test_mode => 1,
      :client_id => ENV["HELLO_SIGN_CLIENT"],
      :template_id => '8a76c9eb3998c1440d359448484dadb9899e2cbf',
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
        :viager => opts[:viager],
        :part=> opts[:part]
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
