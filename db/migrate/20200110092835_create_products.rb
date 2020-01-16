# 商品出品を要件に合わせるため、カテゴリーをカラムとして追加(1/16:中島)
class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :name,             null: false
      t.text    :content,          null: false
      # t.integer :category_id,      null: false, foreign_key: true
      t.string  :size
      # t.integer :brand_id,         foreign_key: true
      t.integer :status,           null: false
      t.integer :s_charge,         null: false
      t.integer :s_method,         null: false
      t.string  :s_prefecture,     null: false
      t.integer :s_date,           null: false
      t.integer :price,            null: false
      t.string  :category_L
      t.string  :category_M
      t.string  :category_S
      t.references :user,          foreign_key: true
      t.timestamps
    end
  end
end
