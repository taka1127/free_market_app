require 'rails_helper'

describe ProductsController do
  describe 'GET #edit' do
    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

end