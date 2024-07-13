class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.references :product, null: false, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
