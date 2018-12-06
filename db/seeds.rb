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
price_a = Price.create(price: '150.99',readjust: '2018-01-22', customer_id: customer_a.id)
price_b = Price.create(price: '180.99',readjust: '2018-01-01', customer_id: customer_b.id)
first_appointment = Appointment.create(start_time: "2018-11-06T18:37:31.878Z", end_time: "2018-11-06T19:37:31.878Z", status: false, price: price_a.price, customer_id: customer_a.id)
second_appointment = Appointment.create(start_time: "2018-11-16T18:37:31.878Z", end_time: "2018-11-16T18:37:31.878Z", status: false, price: price_b.price, customer_id: customer_a.id)
