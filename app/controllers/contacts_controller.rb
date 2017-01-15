class ContactsController < ApplicationController



  def create

     @contact = Contact.new(params.require(:contact).permit(:fullname, :phone, :subject, :message, :email))
     @contact.save

    if @contact.save
      ContactMailer.contact_form(@contact).deliver_now
      redirect_to root_path

    else
      render :new
    end
  end

end
