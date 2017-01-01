class Viager < ApplicationRecord
  belongs_to :old
  has_many :bouquet_shares,  dependent: :destroy
  has_many :rente_shares,  dependent: :destroy

  mount_uploader :photo, PhotoUploader
  mount_uploader :salon, SalonUploader
  mount_uploader :chambre, ChambreUploader
  mount_uploader :exterieur, ExterieurUploader
  mount_uploader :statuts_sci, StatutsSciUploader
  mount_uploader :pacte, PacteUploader
  mount_uploader :compte_courant, CompteCourantUploader
  mount_uploader :acte_propriete, ActeProprieteUploader

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?

  def full_address
    self.address + ', ' + self.city
  end



end
