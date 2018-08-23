class Price < ApplicationRecord
  belongs_to :customer
    validates :price, :readjust, presence: true
end
