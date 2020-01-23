require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'POST #create' do
    it 'saves the new product in the database' do
      expect{post :create, params}
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      expect(assigns(:product))
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the product" do
      expect{delete :destroy, id: product}
    end
  end

  # describe 'PATCH #update' do
  #   it "updates the product" do
  #     expect(assigns(:product))
  #   end
  # end

  # describe 'PATCH #update' do
  #   it '名前が更新される' do
  #     put patch, params: { name: 'new_name!' }
  #     expect(user.name).not_to eq 'old_name'
  #   end
  # end

  describe '#update' do
    it '名前が更新される' do
      # @user = FactoryBot.create(:user)
      # @product = FactoryBot.create(:product)
      # product_params = {name: "ターサージール6"}
      # patch :update, params: { product: product_params }
      # expect(@product.reload.name)
      patch :update, params: { name: "new_name!" }
      expect(product.reload.name)
    end
  end
end