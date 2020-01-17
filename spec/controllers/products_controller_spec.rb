require 'rails_helper'

describe ProductsController do
  describe 'POST #create' do
    it 'saves the new product in the database' do
      expect{post :create, params}
    end
  end
  
  describe 'GET #new' do
    end

end