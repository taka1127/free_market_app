FactoryBot.define do
  factory :user do
    nickname              { "ナナナ" }
    email                 { Faker::Internet.free_email }
    password              { "$2a$11$n79OHUThP67eEGcMxKKprOVBf76/wM" }
    password_confirmation { "$2a$11$n79OHUThP67eEGcMxKKprOVBf76/wM" }
    first_name                  { "中村" }
    last_name                  { "花子" }
    first_name_kana             { "ナカムラ" }
    last_name_kana             { "ハナコ" }
    tel                   { "9999" }
    birthday              { "2020-11-11" }
    self_introduction     { "こんにちは" }
    point                 { "30" }
    proceed               { "3000" }
  end
end 
