class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.float :rating
      t.text :comments
      t.date :feedback_date

      t.timestamps
    end
  end
end
