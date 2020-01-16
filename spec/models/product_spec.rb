require 'rails_helper'
describe Product do
  describe '#create' do
    it "not registrate product !!!!" do
      product = Product.new(name: "", content: "使用期間は2年程度です。", size: "26.5cm", status: "傷が目立つ", s_charge: "送料込み", s_method: "普通郵便", s_prefecture: "大阪府", s_date: "2~3日で発送", price: "300", category_L: "スポーツ", category_M: "靴", category_S: "ランニングシューズ")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
  end
end

# t.string  :name,             null: false
# t.text    :content,          null: false
# # t.integer :category_id,      null: false, foreign_key: true
# t.string  :size
# # t.integer :brand_id,         foreign_key: true
# t.string :status,           null: false
# t.string :s_charge,         null: false
# t.string :s_method,         null: false
# t.string  :s_prefecture,     null: false
# t.string :s_date,           null: false
# t.integer :price,            null: false
# t.string  :category_L
# t.string  :category_M
# t.string  :category_S
# t.references :user,          foreign_key: true
# t.timestamps