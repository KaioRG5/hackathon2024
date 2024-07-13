# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Limpar a tabela products antes de adicionar novos dados
Product.destroy_all

# Adicionar novos produtos (ingredientes)
products = [
  { name: "Tomatoes", expiration_date: Date.new(2024, 8, 20), quantity: 50, uom: "kg" },
  { name: "Lettuce", expiration_date: Date.new(2024, 7, 25), quantity: 30, uom: "heads" },
  { name: "Chicken Breast", expiration_date: Date.new(2024, 9, 15), quantity: 100, uom: "kg" },
  { name: "Salmon Fillet", expiration_date: Date.new(2024, 9, 20), quantity: 50, uom: "kg" },
  { name: "Bacon", expiration_date: Date.new(2024, 8, 30), quantity: 40, uom: "kg" },
  { name: "Eggs", expiration_date: Date.new(2024, 8, 10), quantity: 200, uom: "dozen" },
  { name: "Milk", expiration_date: Date.new(2024, 7, 20), quantity: 150, uom: "liters" },
  { name: "Cheddar Cheese", expiration_date: Date.new(2024, 9, 5), quantity: 60, uom: "kg" },
  { name: "Parmesan Cheese", expiration_date: Date.new(2024, 9, 25), quantity: 40, uom: "kg" },
  { name: "Butter", expiration_date: Date.new(2024, 8, 10), quantity: 70, uom: "kg" },
  { name: "Olive Oil", expiration_date: Date.new(2025, 1, 10), quantity: 100, uom: "liters" },
  { name: "Garlic", expiration_date: Date.new(2024, 12, 15), quantity: 30, uom: "kg" },
  { name: "Onions", expiration_date: Date.new(2024, 11, 5), quantity: 70, uom: "kg" },
  { name: "Bell Peppers", expiration_date: Date.new(2024, 8, 20), quantity: 50, uom: "kg" },
  { name: "Mushrooms", expiration_date: Date.new(2024, 8, 15), quantity: 60, uom: "kg" },
  { name: "Carrots", expiration_date: Date.new(2024, 10, 5), quantity: 80, uom: "kg" },
  { name: "Potatoes", expiration_date: Date.new(2024, 10, 15), quantity: 90, uom: "kg" },
  { name: "Spinach", expiration_date: Date.new(2024, 7, 25), quantity: 40, uom: "kg" },
  { name: "Beef Steak", expiration_date: Date.new(2024, 9, 10), quantity: 100, uom: "kg" },
  { name: "Pasta", expiration_date: Date.new(2025, 2, 15), quantity: 200, uom: "kg" },
  { name: "Rice", expiration_date: Date.new(2025, 3, 5), quantity: 250, uom: "kg" },
  { name: "Salt", expiration_date: Date.new(2026, 5, 20), quantity: 300, uom: "kg" },
  { name: "Black Pepper", expiration_date: Date.new(2025, 7, 10), quantity: 100, uom: "kg" },
  { name: "Paprika", expiration_date: Date.new(2025, 8, 25), quantity: 70, uom: "kg" },
  { name: "Basil", expiration_date: Date.new(2024, 9, 30), quantity: 30, uom: "kg" },
  { name: "Oregano", expiration_date: Date.new(2025, 2, 20), quantity: 40, uom: "kg" },
  { name: "Thyme", expiration_date: Date.new(2025, 1, 15), quantity: 20, uom: "kg" },
  { name: "Rosemary", expiration_date: Date.new(2025, 3, 10), quantity: 25, uom: "kg" },
  { name: "Bay Leaves", expiration_date: Date.new(2025, 4, 5), quantity: 15, uom: "kg" },
  { name: "Red Wine", expiration_date: Date.new(2025, 12, 25), quantity: 200, uom: "liters" },
  { name: "White Wine", expiration_date: Date.new(2025, 11, 20), quantity: 150, uom: "liters" },
  { name: "Chicken Broth", expiration_date: Date.new(2024, 9, 15), quantity: 120, uom: "liters" },
  { name: "Beef Broth", expiration_date: Date.new(2024, 10, 5), quantity: 110, uom: "liters" },
  { name: "Vegetable Broth", expiration_date: Date.new(2024, 8, 30), quantity: 130, uom: "liters" },
  { name: "Tomato Sauce", expiration_date: Date.new(2025, 1, 10), quantity: 180, uom: "liters" },
  { name: "Ketchup", expiration_date: Date.new(2025, 6, 25), quantity: 160, uom: "liters" },
  { name: "Mayonnaise", expiration_date: Date.new(2025, 5, 20), quantity: 140, uom: "liters" },
  { name: "Soy Sauce", expiration_date: Date.new(2025, 3, 15), quantity: 200, uom: "liters" },
  { name: "Honey", expiration_date: Date.new(2026, 1, 25), quantity: 100, uom: "kg" },
  { name: "Brown Sugar", expiration_date: Date.new(2025, 8, 30), quantity: 90, uom: "kg" },
  { name: "White Sugar", expiration_date: Date.new(2026, 2, 15), quantity: 100, uom: "kg" },
  { name: "Flour", expiration_date: Date.new(2025, 5, 5), quantity: 150, uom: "kg" },
  { name: "Yeast", expiration_date: Date.new(2025, 10, 20), quantity: 50, uom: "kg" },
  { name: "Baking Powder", expiration_date: Date.new(2026, 1, 10), quantity: 40, uom: "kg" },
  { name: "Baking Soda", expiration_date: Date.new(2026, 2, 20), quantity: 35, uom: "kg" },
  { name: "Cinnamon", expiration_date: Date.new(2025, 12, 5), quantity: 25, uom: "kg" },
  { name: "Nutmeg", expiration_date: Date.new(2026, 3, 15), quantity: 20, uom: "kg" },
  { name: "Vanilla Extract", expiration_date: Date.new(2026, 5, 25), quantity: 30, uom: "liters" }
]

# Criar produtos no banco de dados
products.each do |product|
  Product.create(
    name: product[:name],
    expiration_date: product[:expiration_date],
    quantity: product[:quantity],
    uom: product[:uom],
    created_at: Time.now,
    updated_at: Time.now
  )
end

puts "Seed data added successfully!"
