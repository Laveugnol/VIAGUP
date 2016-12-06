class RenteShare < ApplicationRecord
  belongs_to :user
  belongs_to :rente
  belongs_to :viager
end
