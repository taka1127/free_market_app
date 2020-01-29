crumb :root do
  link "トップページ", root_path
end

crumb :user do
  link "マイページ", mypage_index_path
  parent :root
end

crumb :logout do

  link "ログアウト", logout_mypage_index_path
  parent :user
end

crumb :profile do
  link "プロフィール", profile_mypage_index_path
  parent :user
end

crumb :payment do
  link "支払い方法", payment_mypage_index_path
  parent :user
end

crumb :register do
  link "本人情報の登録", register_mypage_index_path
  parent :user
end

