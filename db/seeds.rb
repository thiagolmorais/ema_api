# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer_a = Customer.create(name: 'Customer A', email: 'customer.a@email.com',
                             phone: '123456789', status: true)
Customer.create(name: 'Customer B', email: 'customer.b@email.com',
                phone: '987654321', status: false)
Price.create(price: '150.99',readjust: '2018-08-22', customer_id: customer_a.id)
