class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string  :category_L
      t.string  :category_M
      t.string  :category_S
      t.references :product,   foreign_key: true

      t.timestamps
    end
  end
end
