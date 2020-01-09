class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :name,             null: false
      t.text    :content,          null: false
      t.integer :category_id,      null: false, foreign_key: true
      t.string  :size
      t.integer :brand_id,         foreign_key: true
      t.integer :status,           null: false
      t.integer :delivery_charge,  null: false
      t.integer :shipping_method,  null: false
      t.integer :date_of_shipment, null: false
      t.integer :price,            null: false
      t.integer :user_id,          null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
