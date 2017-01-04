class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_viager_in_admin, only: [:signature_viager_2, :acte_propriete2,
                                             :statuts_sci2, :pacte_associes2, :compte_courant2]

  def home
    @user = current_user
  end

  def profil
    @user = current_user
  end

  def invest_step1
    @investment_profile = InvestmentProfile.new
  end

  def invest_step2
    if current_user.profil_completed == false
    @investment_profile = current_user.investment_profile
      @civilite = ["Monsieur", "Madame"]
      @categorie = ["Agriculteur", "Artisan", "Chef d'entreprise", "Cadre", "Professeur", "Profession libérale", "Profession scientfique ou artistique", "Profession intermédiare", "Employé", "Ouvrier", "Retraité", "Sans activité professionnelle"]
      @expertise = ["Architecture", "Autre", "BTP et second oeuvre", "Commerciale", "Comptabilité & finance", "Edition/Ecriture", "Formation/Education", "Gestion de projet", "Hotellerie", "Informatique", "Ingénierie", "Maintenance & réparation", "Immobilier", "Juridique", "Logistique", "Marketing", "Production", "Qualité", "Recherche", "Ressources humaines", "Santé", "Sécurité", "Services administratifs", "Service clientèle", "Stratégie & management"]
      @invest4 = ["Réduction fiscale", "Recherche d'un profit important à long terme", "Diversification du portefeuille"]
      @patrimoine2 = ["Inférieur à 200 000€", "Supérieur à 200 000€", "Inférieur à 500 000€", "Supérieur à 500 000€"]
      @blanchiement1 = ["Salaires", "Revenus fonciers", "Pensions, retraites"]
    else
      redirect_to pages_profil_path(current_user)
    end
  end

  def invest_step3
    if current_user.doc_sent == false
      @investment_profile = current_user.investment_profile
    else
      redirect_to pages_profil_path(current_user)
    end
  end

  def invest_step4

    if current_user.certificat == false
      @investment_profile = current_user.investment_profile

    else
      redirect_to pages_profil_path(current_user)
    end
  end

  def finalize
    current_user.certificat = true
    current_user.save
    UserMailer.profile_invest_signed(current_user).deliver_now
  end

  def attribution
    @number = current_user.investment_profile.essai.to_i
    @viager_id = Viager.find(current_user.investment_profile.product)
    @viager = Viager.find(@viager_id)
    @number.times do
      @rente_share = RenteShare.where(viager_id: @viager_id, assign: false).first
      @rente_share.user_id = current_user.id
      @rente_share.assign = true
      @rente_share.save
      @bouquet_share = BouquetShare.where(viager_id: @viager_id, assign: false).first
      @bouquet_share.user_id = current_user.id
      @bouquet_share.assign = true
      @bouquet_share.save
    end
    RenteShareMailer.investissement(@number, @viager).deliver_now
  end

  def creation_viager
    @viager = Viager.new() if current_user.admin
  end

  def signature_viager_2
  end

  def assign_acquisition
    a = params.require(:viager).permit(:acquisition) if current_user.admin
    @viager = Viager.find(params[:format].to_i)
    @viager.update_attributes(a)
    @viager.save
    redirect_to pages_admin_path
  end

  def acte_propriete2
  end

  def assign_acte
    a = params.require(:viager).permit(:acte_propriete) if current_user.admin
    @viager = Viager.find(params[:format].to_i)
    @viager.update_attributes(a)
    @viager.save
    redirect_to pages_admin_path
  end

  def statuts_sci2
  end

  def assign_statuts
    a = params.require(:viager).permit(:statuts_sci) if current_user.admin
    @viager = Viager.find(params[:format].to_i)
    @viager.update_attributes(a)
    @viager.save
    redirect_to pages_admin_path
  end

  def pacte_associes2
  end

  def assign_pacte
    a = params.require(:viager).permit(:pacte) if current_user.admin
    @viager = Viager.find(params[:format].to_i)
    @viager.update_attributes(a)
    @viager.save
    redirect_to pages_admin_path
  end

  def compte_courant2
  end

  def assign_compte
    a = params.require(:viager).permit(:compte_courant) if current_user.admin
    @viager = Viager.find(params[:format].to_i)
    @viager.update_attributes(a)
    @viager.save
    redirect_to pages_admin_path
  end

  def admin
    @viagers = Viager.all if current_user.admin
  end

  def old
    @viager = Viager.find(params[:id]) if current_user.admin
    @old = Old.new
  end

  def epargne
    @user = current_user
    @viagers = find_viagers_launched(@user)
    @viagers_not_ready = find_viagers_not_launched_yet(@user)
    @montant_investi = montant_investi(@viagers, @user)
    @prelevement_futur = prelevement_futur(@viagers, @user)
    @gain_potentiel = gain(@viagers, @user) - @montant_investi - @prelevement_futur
  end

  def validation_profil
    @user = User.find(params[:format].to_i)
  end

  def validate_profil
    @user = User.find(params[:format].to_i)
    @user.profil_valid = true
    @user.save
    UserMailer.validation(@user).deliver_now
    redirect_to pages_admin_path
  end


private

  def find_viagers_launched(user)
    id = user.id
    viagers = []
    viagers_launched_per_user = []
    Viager.all.each do |viager|
      if viager.acquisition != nil
        viagers << viager
      end
    end
    viagers.each do |viager|
      if RenteShare.where(viager_id: viager.id, assign: true, user_id: id).count != 0
        viagers_launched_per_user << viager
      end
    end
    viagers_launched_per_user
  end


  def find_viagers_not_launched_yet(user)
    id = user.id
    viagers = []
    viagers_launched_per_user = []
    Viager.all.each do |viager|
      if viager.acquisition == nil
        viagers << viager
      end

    end
    viagers.each do |viager|
      if RenteShare.where(viager_id: viager.id, assign: true, user_id: id).count != 0
        viagers_launched_per_user << viager
      end
    end
    viagers_launched_per_user
  end

  def montant_investi(viagers, user)
    sum = 0
    viagers.each do |viager|
      acquisition_date = viager.acquisition

      mensualites = ((Time.now-viager.acquisition)/(60*60*24))/30.4375
      parts = RenteShare.where(viager_id: viager.id, assign: true, user_id: user.id).count
      sum += (viager.bouquet/viager.number_share)* parts + ((viager.rente/viager.number_share) * parts * mensualites)

    end
    sum.round(0)

  end

  def prelevement_futur(viagers, user)
    sum = 0
    viagers.each do |viager|
      total_month = viager.horizon*12

      mensualites = total_month -(((Time.now-viager.acquisition)/(60*60*24))/30.4375)
      parts = RenteShare.where(viager_id: viager.id, assign: true, user_id: user.id).count
      sum += (viager.rente/viager.number_share) * parts * mensualites
    end
    sum.round(0)
  end

  def gain(viagers, user)
    gain = 0
    viagers.each do |viager|
      parts = RenteShare.where(viager_id: viager.id, assign: true, user_id: user.id).count
      gain += (viager.venale.to_i/viager.number_share) * parts
    end
    gain.round(0)
  end

  def set_viager_in_admin
    @viager = Viager.find(params[:format].to_i)
  end


end
