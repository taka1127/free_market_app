FactoryBot.define do
  factory :product do
    name {"saifu"}
    content {"５年前に購入しました"}
    status {"良い"}
    delivery_charge {"発送者負担"}
    shipping_method {"メルカリ便"}
    date_of_shipment {"３日"}
    shipingplace {"兵庫県"}
    price {"7000"}
    association :brand, factory: :brand, brand: "1"
    association :category, factory: :category, category_L: "レディス"
    association :user, factory: :user, name: "tanaka"
  end
end
