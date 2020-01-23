# 商品出品を要件に合わせるため、カテゴリーをカラムとして追加(1/16:中島)
class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :name,             null: false
      t.text    :content,          null: false
      # t.integer :category_id,      null: false, foreign_key: true
      t.string  :size
      t.string :brand_name,         foreign_key: true
      t.string :status,           null: false
      t.string :s_charge,         null: false
      t.string :s_method,         null: false
      t.string  :s_prefecture,     null: false
      t.string :s_date,           null: false
      t.integer :price,            null: false
      t.string  :category,
      t.references :user,          foreign_key: true
      t.timestamps
    end
  end
end
