require 'rails_helper'

describe Image do
  describe '#create' do
    it "is invalid without a image" do
      product_image = build(:image)
      product_image.valid?
      expect(product_image.errors[:image])
    end
  end
end