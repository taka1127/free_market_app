require 'rails_helper'

  describe 'POST #create' do
    it 'saves the new product in the database' do
      expect{post :create, params}
    end
  end

  describe 'GET #show' do
    it "assigns the requested tweet to @product" do
      product = create(:product)
      get :show, params: { id: product }
      expect(assigns(:product)).to eq product
    end

    it "renders the :edit template" do
    end




end