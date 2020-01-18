require 'rails_helper'

  describe 'POST #create' do
    it 'saves the new product in the database' do
      expect{post :create, params}
    end
  end

end