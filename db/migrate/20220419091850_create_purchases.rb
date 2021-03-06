class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string  :postal_code,   null: false
      t.integer :prefecture_id, null: false
      t.string  :city,          null: false
      t.string  :house_number,  null: false
      t.string  :build_number
      t.string  :phone_number,  null: false

      t.references :purchase_history, foreign_key: true
      t.timestamps
    end
  end
end
