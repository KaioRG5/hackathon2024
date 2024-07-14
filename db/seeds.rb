# Clear existing data
Product.destroy_all
Sale.destroy_all
Feedback.destroy_all

# Create products with random prices
products = [
  { name: "Tomatoes", expiration_date: Date.new(2024, 8, 20), quantity: 50, uom: "kg" },
  { name: "Lettuce", expiration_date: Date.new(2024, 7, 25), quantity: 30, uom: "heads" },
  { name: "Chicken Breast", expiration_date: Date.new(2024, 9, 15), quantity: 100, uom: "kg" },
  { name: "Salmon Fillet", expiration_date: Date.new(2024, 9, 20), quantity: 50, uom: "kg" },
  { name: "Bacon", expiration_date: Date.new(2024, 8, 30), quantity: 40, uom: "kg" },
  { name: "Eggs", expiration_date: Date.new(2024, 8, 10), quantity: 200, uom: "dozen" },
  { name: "Milk", expiration_date: Date.new(2024, 7, 20), quantity: 150, uom: "liters" },
  { name: "Cheddar Cheese", expiration_date: Date.new(2024, 9, 5), quantity: 60, uom: "kg" },
]

# Create products in the database
created_products = products.map do |product|
  Product.create(
    name: product[:name],
    expiration_date: product[:expiration_date],
    quantity: product[:quantity],
    uom: product[:uom],
    price: rand(1.0..100.0).round(2), # Random price between 1.0 and 100.0
    created_at: Time.now,
    updated_at: Time.now
  )
end

# Create feedbacks
Feedback.create(user_id: 1, rating: 1, comments: 'Needs improvement.', feedback_date: Date.today)
Feedback.create(user_id: 2, rating: 5, comments: 'Excellent!', feedback_date: Date.today)
Feedback.create(user_id: 3, rating: 5, comments: 'Very good!', feedback_date: Date.today)
Feedback.create(user_id: 4, rating: 5, comments: 'Great!', feedback_date: Date.today)
Feedback.create(user_id: 5, rating: 5, comments: 'Fantastic!', feedback_date: Date.today)
Feedback.create(user_id: 6, rating: 5, comments: 'Amazing!', feedback_date: Date.today)

# Create sales with valid product associations
sales = [
  { product: created_products.sample, quantity: 5, sale_price: rand(5.0..50.0).round(2), sale_date: Date.today },
  { product: created_products.sample, quantity: 10, sale_price: rand(5.0..50.0).round(2), sale_date: Date.today },
  { product: created_products.sample, quantity: 2, sale_price: rand(5.0..50.0).round(2), sale_date: Date.today - 1 },
  { product: created_products.sample, quantity: 7, sale_price: rand(5.0..50.0).round(2), sale_date: Date.today - 2 },
  # Add more sales as needed
]

sales.each do |sale|
  Sale.create(
    product: sale[:product],
    quantity: sale[:quantity],
    sale_price: sale[:sale_price],
    sale_date: sale[:sale_date],
    created_at: Time.now,
    updated_at: Time.now
  )
end

puts "Seed data added successfully!"
