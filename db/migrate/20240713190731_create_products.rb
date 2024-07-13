class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.date :expiration_date
      t.float :quantity
      t.string :uom

      t.timestamps
    end
  end
end
