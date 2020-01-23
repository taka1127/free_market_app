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

  describe 'delete #destroy' do
    it "deletes the product" do
      expect{delete :destroy, id: product}
    end
  end
end