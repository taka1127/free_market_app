class CreateBrandCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :brand_categories do |t|
      t.integer :brand_id, null: false, foreign_key:true
      t.integer :category_id, null: false, foreign_key:true

      t.timestamps
    end
  end
end
