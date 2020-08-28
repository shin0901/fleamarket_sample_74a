require 'rails_helper'


RSpec.describe Product, type: :model do
  
  describe '#create' do
    context '商品を出品できる場合' do
      it 'name,description,priceの値が入っていれば出品できること' do
        expect(create(:product)).to be_valid
      end
      
    end

    context '商品を出品できない場合' do
      it 'nameの値が入っていなければ出品できないこと' do
        product = build(:product, name: nil)
        product.valid?
        expect(product.errors[:name]).to include("を入力してください")
      end
      
      it 'descriptionの値が入っていなければ出品できないこと' do
        product = build(:product, description: nil)
        product.valid?
        expect(product.errors[:description]).to include("を入力してください")
      end
      
      it 'priceに値が入っていなければ出品できないこと' do
        product = build(:product, price: nil)
        product.valid?
        expect(product.errors[:price]).to include("を入力してください")
      end

      it 'user_idが無いと出品できないこと' do
        product = build(:product, user_id: nil)
        product.valid?
        expect(product.errors[:user]).to include("を入力してください")
      end

      it 'category_idが無いと出品できないこと' do
        product = build(:product, user_id: nil)
        product.valid?
        expect(product.errors[:category]).to include("を入力してください")
      end

    end

  end


end
