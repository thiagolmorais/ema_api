class Invoice < ApplicationRecord
  belongs_to :appointment
  has_one :customer, through: :appointment
  validates :appointment_id, uniqueness: true, on: :create
end
