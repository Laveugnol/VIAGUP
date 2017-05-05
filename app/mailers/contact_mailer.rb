class ContactMailer < ApplicationMailer


  def contact_form(contact)
    @contact = contact  # Instance variable => available in view

    mail(to: "arnaud@viagup.com", subject: "Contact Viag'up: #{@contact.subject}", from: "#{@contact.email}")

  end

end
