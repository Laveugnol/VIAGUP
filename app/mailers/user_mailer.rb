class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: "Bienvenue au sein de la communauté Viag'Up")
    # This will render a view in `app/views/user_mailer`!
  end


  def profile_invest_signed(user)

    @user = user
    mail(to: @user.email, from: 'Administration@viagup.com', subject: "Vous venez de signer votre fiche d'information.")
    # This will render a view in `app/views/user_mailer`!
  end

  def validation(user)
    @user = user
    mail(to: @user.email, from: 'Arnaud@viagup.com', subject: "Profil validé! Vous allez faire un malheur!")
  end

end
