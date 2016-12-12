class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

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
    @investment_profile = current_user.investment_profile
  end

end
