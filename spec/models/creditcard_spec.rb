require 'rails_helper'

RSpec.describe Creditcard, type: :model do

  describe Creditcard do
    describe '#create' do
      it "user_id, customer_id, card_idが存在すれば登録できること" do
        user = FactoryBot.create(:user)
        card = build(:creditcard, user_id:  user.id)
        expect(card).to be_valid
      end
      it "user_idが無い場合は登録できないこと" do
        card = build(:creditcard, user_id: nil)
        card.valid?
        expect(card.errors[:user_id]).to include("を入力してください")
      end
      it "customer_idが無い場合は登録できないこと" do
        card = build(:creditcard, customer_id: nil)
        card.valid?
        expect(card.errors[:customer_id]).to include("を入力してください")
      end
      it "card_idが無い場合は登録できないこと" do
        card = build(:creditcard, card_id: nil)
        card.valid?
        expect(card.errors[:card_id]).to include("を入力してください")
      end
    end
  end
end
