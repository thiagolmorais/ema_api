class Customer < ApplicationRecord
  validates :name, :email, :phone, presence: true
end
