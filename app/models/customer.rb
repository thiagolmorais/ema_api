class Customer < ApplicationRecord
  has_many :prices
  validates :name, :email, :phone, presence: true

end
