# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Setting.create(readjust: 12, duration: 3600)
customer_a = Customer.create(name: 'Customer A', email: 'customer.a@email.com',
                             phone: '123456789', status: true)
customer_b = Customer.create(name: 'Customer B', email: 'customer.b@email.com',
                             phone: '987654321', status: false)
Price.create(price: '150.99',readjust: '2018-08-22', customer_id: customer_a.id)
Price.create(price: '150.99',readjust: '2018-08-22', customer_id: customer_b.id)
first_appointment = Appointment.create(start_time: Time.now, end_time: Time.now+3600, status: true, price: 150.00, customer_id: customer_a.id)
second_appointment = Appointment.create(start_time: Time.now-1.day, end_time: Time.now-1.day+3600, status: true, price: 150.00, customer_id: customer_a.id)
Invoice.create(appointment_id: first_appointment.id, value: first_appointment.price, competence: "Abril/2018", due_date: '2018-05-05', payment: '2018-05-05', status: true)
Invoice.create(appointment_id: second_appointment.id, value: second_appointment.price, competence: "Abril/2018", due_date: '2018-05-09', payment: nil, status: false)
