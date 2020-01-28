require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    it "renders the :show template" do
      expect(assigns(:user))
    end
  end

  describe 'GET #logout' do
    it "renders the :logout template" do
      expect(assigns(:user))
    end
  end

end
