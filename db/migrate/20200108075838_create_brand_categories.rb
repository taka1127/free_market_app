class CreateBrandCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :brand_categories do |t|

      t.timestamps
    end
  end
end
