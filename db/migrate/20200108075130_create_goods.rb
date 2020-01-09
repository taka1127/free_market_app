class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.integer :user_id,     null: false,foreign_key: true
      t.integer :product_id,  null: false,foreign_key: true
      t.timestamps
    end
  end
end
