class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :brand
      t.integer :brand_category_id,   null: false,foreign_key: true

      t.timestamps
    end
  end
end
