class Contact < ApplicationRecord
  validates :fullname, :email, :subject,  :message,  presence: true
  validates :email, :format => { :with => %r{.+@.+\..+} }, allow_blank: true
end
