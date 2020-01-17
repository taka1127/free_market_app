require 'rails_helper'
describe Product do
  describe '#create' do
    it "is invalid without a name" do
      product = build(:product)
      product.valid?
      expect(product.errors[:name])
    end

    it "is invalid without a content " do
      product = build(:product)
      product.valid?
      expect(product.errors[:content])
    end

    it "is invalid without a size " do
      product = build(:product)
      product.valid?
      expect(product.errors[:size])
    end

    it "is invalid without a status " do
      product = build(:product)
      product.valid?
      expect(product.errors[:status])
    end

    it "is invalid without a s_charge " do
      product = build(:product)
      product.valid?
      expect(product.errors[:s_charge])
    end

    it "is invalid without a s_method " do
      product = build(:product)
      product.valid?
      expect(product.errors[:s_method])
    end

    it "is invalid without a s_prefecture " do
      product = build(:product)
      product.valid?
      expect(product.errors[:s_prefecture])
    end

    it "is invalid without a s_date " do
      product = build(:product)
      product.valid?
      expect(product.errors[:s_date])
    end

    it "is invalid without a price " do
      product = build(:product)
      product.valid?
      expect(product.errors[:price])
    end

    it "is invalid without a caregory_L " do
      product = build(:product)
      product.valid?
      expect(product.errors[:caregory_L])
    end

    it "is invalid without a caregory_M " do
      product = build(:product)
      product.valid?
      expect(product.errors[:caregory_M])
    end

    it "is invalid without a caregory_S " do
      product = build(:product)
      product.valid?
      expect(product.errors[:caregory_S])
    end

    it "is invalid without a user_id " do
      product = build(:product)
      product.valid?
      expect(product.errors[:user_id])
    end
  end
end
