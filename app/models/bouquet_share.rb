class BouquetShare < ApplicationRecord
  belongs_to :user
  belongs_to :bouquet
  belongs_to :viager
end
