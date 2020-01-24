FactoryBot.define do
  factory :product do
    name               { "シャネル" }
    content            { "使用期間は2年程度です。" }
    size               { "26.5cm" }
    status             { "傷が目立つ" }
    s_charge           { "送料込み" }
    s_method           { "普通郵便" }
    s_prefecture       { "大阪府" }
    s_date             { "2~3日で発送" }
    price              { 300 }
    category           { "レディース" }
    user
  end
end
