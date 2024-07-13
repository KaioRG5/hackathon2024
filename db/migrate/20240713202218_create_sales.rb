class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.references :product, null: false, foreign_key: true
      t.float :quantity
      t.float :sale_price
      t.date :sale_date

      t.timestamps
    end
  end
end
