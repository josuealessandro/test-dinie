# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
customers_data = [
  { customer_name: 'Ana', first_payment_delay: 14, payment_day: 12 },
  { customer_name: 'Bento', first_payment_delay: nil, payment_day: nil },
  { customer_name: 'Carlos', first_payment_delay: 30, payment_day: 1 },
  { customer_name: 'Diana', first_payment_delay: 10, payment_day: 9 },
  { customer_name: 'Elias', first_payment_delay: 14, payment_day: 25 }
]

customers_data.each do |data|
  Customer.create(data)
end