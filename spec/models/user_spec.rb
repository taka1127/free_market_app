require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a mail_address" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    
    it "is invalid without a name_kana" do
      user = build(:user, name_kana: nil)
      user.valid?
      expect(user.errors[:name_kana]).to include("を入力してください")
    end

    it "is invalid without a tel" do
      user = build(:user, tel: nil)
      user.valid?
      expect(user.errors[:tel]).to include("を入力してください")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
  describe "facebook連携でサインアップする" do

    # before do
    #   OmniAuth.config.mock_auth[:facebook] = nil
    #   Rails.application.env_config['omniauth.auth'] = facebook_mock
    # end

    it "指定のemailアドレスを持つユーザーが登録されていればそのユーザーを返す" do
      binding.pry
      user = create(:user, email: "sample@test.com")
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      user2 = build(:user,)

    end

    it "指定のemailアドレスを持つユーザーが登録されていなければ新規にユーザーを作成させる" do
      user = build(:user, email: "somple@tist.com")
    end
  end
end