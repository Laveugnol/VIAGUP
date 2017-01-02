class RenteShareMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def investissement(parts, viager)
    # Instance variable => available in view
    @user = current_user
    @parts = parts
    @viager = viager

    mail(to: @user.email, subject: "Votre souscription a été prise en compte")
    # This will render a view in `app/views/user_mailer`!
  end

end
