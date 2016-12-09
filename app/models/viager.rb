class Viager < ApplicationRecord
  belongs_to :old

  mount_uploader :photo, PhotoUploader
end
