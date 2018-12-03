class Api::AppointmentsController < ApplicationController

  def index
    appointments = Appointment.all.order(:start_time)
    appointments = appointments.map do |appointment|
       appointment.as_json.merge(customer: appointment.customer.name)
    end
    json = appointments.as_json
    render json: json
  end

  def show
    appointment = Appointment.find(params[:id])
    appointment = appointment.as_json.merge(customer: appointment.customer.name)
    json = appointment.as_json
    render json: json
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Compromisso não encontrado' }, status: 404
  end

  def create
    create_params
    if @appointment.save
      render json: { message: 'Compromisso cadastrado com sucesso.' }, status: 201
    else
      render json: { message: @appointment.errors.full_messages }
    end
  end

  def update
    appointment = Appointment.find(params[:id])
    if appointment.update(appointment_params)
      render json: { message: 'Compromisso editado com sucesso.' }
    else
      render json: { message: 'Compromisso não pode ser editado.' }
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    if appointment.destroy
      render json: { message: 'Compromisso deletado com sucesso.' }, status: 200
    end
  end

  private

  def appointment_params
    params.permit(:customer_id, :end_time, :price, :start_time)
  end

  def create_params
    appointment = Appointment.new(appointment_params)
    duration = Setting.last.duration
    appointment.end_time = appointment.start_time + duration if appointment.start_time
    appointment.price = appointment.customer.current_price.first.price
    @appointment = appointment
  end
end
