class Invoice < ApplicationRecord
  belongs_to :appointment
  has_one :customer, through: :appointment
end
