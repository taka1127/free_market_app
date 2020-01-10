class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string  :category_L
      t.string  :category_M
      t.string  :category_S
      t.timestamps
    end
  end
end
