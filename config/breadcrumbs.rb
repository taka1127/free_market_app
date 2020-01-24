crumb :root do
  link "トップページ", root_path
end

crumb :user do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :user
end

