class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :rente_shares
  has_many :bouquet_shares
  has_many :rentes, through: :rente_shares, dependent: :nullify
  has_many :bouquets, through: :bouquet_shares, dependent: :nullify

end
