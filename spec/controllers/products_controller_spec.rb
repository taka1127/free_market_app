require 'rails_helper'
describe ProductsController do
  describe 'GET #show' do
    it "assigns the requested product to @product" do
      product = create(:product)
      # get :show, params: { id: product }
      # expect(assigns(:product)).to eq product
    end
  end

  describe 'GET #show' do
    it "renders the :edit template" do
      binding.pry
      product = create(:product)
      # get :show, params: { id: product }
      # expect(response).to render_template :show
    end  
  end

  describe 'POST #create' do
    it 'saves the new product in the database' do
      expect{post :create, params}
    end
  end

end