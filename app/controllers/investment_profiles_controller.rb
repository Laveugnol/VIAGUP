class InvestmentProfilesController < ApplicationController
  before_action :set_investment_profile, only: [ :edit, :update ]
  def new
  end

  def create

     @user = current_user
     @investment_profile = InvestmentProfile.new(investment_profile_params)
     @investment_profile.user = @user
     @user.save

    if @investment_profile.save


      redirect_to pages_invest_step2_path(@current_user, @investment_profile)
    else
      render "pages/invest_step1"
    end
  end

  def edit
  end

  def update
    @investment_profile.update_attributes(investment_profile_params)
    if @investment_profile.save
      @user.profil_completed = true
      @user.save
      redirect_to pages_invest_step3_path
    else
      flash[:alert] = "Merci de compléter les champs marqués d'un * !"
      render :new
    end
  end

  private

  def set_investment_profile
    @investment_profile = InvestmentProfile.find(params[:id])
  end

  def investment_profile_params
    params.require(:investment_profile).permit(:question1, :question2, :civilite,
                   :nom, :prenom, :categoriesp, :expertise, :adresse, :complementadresse,
                   :code_postal, :pays, :bitrh_date, :birth_place, :phone, :mobile, :ville, :nationalite,
                   :invest1, :invest2, :invest3, :invest4, :invest5, :invest6,
                   :invest8, :patrimoine1, :patrimoine2, :patrimoine3, :patrimoine4,
                   :patrimoine5, :patrimoine6, :patrimoine7, :patrimoine8,
                   :patrimoine9, :blanchiement1, :blanchiement2)
  end

end
