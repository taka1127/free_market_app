# require 'rails_helper'

# describe Users::RegistrationsController, type: :controller do



#   describe '#new' do
#   subject {
#     user_params = attributes_for(:user)
#     post :create, params: { user: user_params},
#                   session: {
#                     nickname: "tanegashiman",
#                     email: "kkk@gmail.com",
#                     password: "123456a",
#                     password_confirmation: "123456a",
#                   }
#   }

#     it "保存することができる" do
#       # binding.pry
#       user_params = attributes_for(:user)
#       expect do
#         subject
#       end.to change { User.count }.by(1)
#     end
#   end
# end

#   describe '#update' do
#   it '名前が更新される' do
#     @product = FactoryBot.create(:product)
#     @user = User.find(@product.user_id)
#     login @user
#     params = { product: attributes_for(:product)}
#     params[:id] = @product.id
#     params[:product][:name] = "ナイキシューズ"
#     patch :update, params: params
#     expect(@product.reload.name).not_to eq "ターサージール6"
#   end
# end

