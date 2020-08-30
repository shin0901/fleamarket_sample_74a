require 'rails_helper'

RSpec.describe Image, type: :model do
  describe '#create' do

    context '画像を保存できる場合' do

      it'imageカラムに値が入っていれば保存できること' do
        expect(create(:image)).to be_valid
      end

    end

    context '画像を保存できない場合' do

      it'imageカラムに値が入っていなければ保存できないこと' do
        image = build(:image, name: nil)
        image.valid?
        # 画像登録時のエラーメッセージに合わせて'include()'の表現は変更予定
        expect(image.errors[:image]).to include("を登録してください")
      end

    end

  end
end