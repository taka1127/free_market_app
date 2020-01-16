class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :name,             null: false
      t.text    :content,          null: false
      t.integer :category_id,      null: false, foreign_key: true
      t.string  :size
      t.integer :brand_id,         null: false, foreign_key: true
      t.string  :status,           null: false
      t.string  :delivery_charge,  null: false
      t.string  :shipping_method,  null: false
      t.string  :date_of_shipment, null: false
      t.string  :shipingplace,     null: false
      t.integer :price,            null: false
      t.references :user,          foreign_key: true
      t.timestamps
    end
  end
end
