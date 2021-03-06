require "rails_helper"

describe "UserFeature" do

  describe "facebook連携でサインアップする" do

    before do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      visit new_user_session_path
    end

    # it "サインアップするとユーザーが増える" do
    #   expect{
    #     click_link "Facebookでログイン"
    #   }.to change(User, :count).by(1)
    # end

    it "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
      click_link "Facebookでログイン"
      
      click_link destroy_user_session_path
      click_link "ログイン"
      expect{
        click_link "Facebookでログイン"
      }.not_to change(User, :count)
    end
  end
end