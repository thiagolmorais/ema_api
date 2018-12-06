class Customer < ApplicationRecord
  has_many :prices
  has_many :appointments
  has_many :invoices, through: :appointments
  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: true

  def status_customer
  status ? 'Ativo' : 'Inativo'
  end

  def prices
    Price.where(customer_id: self).order(readjust: :desc)
  end

  def current_price
    self.prices.order(readjust: :desc).
                where("readjust < ?", Time.now).
                limit(1)
  end

  def active_customers
    Customer.where(status: true)
  end


end
