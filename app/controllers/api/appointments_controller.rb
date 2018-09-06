class Api::AppointmentsController < ApplicationController

  def index
    appointments = Appointment.all.order(:date, :start_time)
    json = appointments.as_json
    render json: json
  end

  def show
    appointment = Appointment.find(params[:id])
    json = appointment.as_json
    render json: json
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Compromisso não encontrado' }, status: 404
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: { message: 'Compromisso cadastrado com sucesso.' }, status: 201
    else
      render json: { message: 'Compromisso não pode ser cadastrado.' }
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
    params.permit(:customer_id, :date, :end_time, :price, :start_time)
  end
end
