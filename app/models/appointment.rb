class Appointment < ApplicationRecord
  belongs_to :customer
  validates :date, :start_time, :end_time, :price, presence: true
  validate :available_appointment?

  def status_appointment
    status ? 'Atendido' : 'Agendado'
  end

  def available_appointment?
    if Appointment.where("start_time < ? AND end_time > ? AND date = ?", self.end_time, self.start_time, self.date).any?
      self.errors.add('date',I18n.t('activerecord.attributes.appointment.errors.date.taken'))
    end
  end
end
