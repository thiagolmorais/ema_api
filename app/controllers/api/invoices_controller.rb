class Api::InvoicesController < ApplicationController
  def index
    invoices = Invoice.all.order(:due_date)
    invoices = invoices.map do |invoice|
       invoice.as_json.merge(customer: invoice.customer)
    end
    json = invoices.as_json
    render json: json
  end

  def create
    appointment = Appointment.find(params[:appointment_id])
    invoice = Invoice.new
    invoice.appointment_id = appointment.id
    invoice.value = appointment.price
    invoice.competence = "#{appointment.start_time.to_date.month}/#{appointment.start_time.to_date.year}"
    invoice.due_date = Time.now+10.days
    if invoice.save
      appointment.update(status: true)
      return render json: invoice
    end
    render json: { message: 'Erro' }, status: 404
  end

  def quitar
    invoice = Invoice.find(params[:id])
    invoice.status = true
    invoice.payment = params[:payment]
    if invoice.save
      render json: { message: 'Fatura quitada.' }
    else
      render json: { message: 'Fatura não pode ser quitada.' }
    end
  end

  def estornar
    invoice = Invoice.find(params[:id])
    if Invoice.find_by(appointment_id: appointment.id)
      invoice.destroy
      render json: { message: 'Pagamento estornado.' }
    else
      render json: { message: 'Pagamento não pode ser estornado, há faturas quitadas.' }
    end
  end

  private

  def invoice_params
    params.permit(:appointment_id, :value, :competence, :due_date, :payment, :status)
  end
end
