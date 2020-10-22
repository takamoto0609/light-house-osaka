require 'rails_helper'

RSpec.describe Room do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム新規作成' do
    #正常系
    context '新規作成がうまくいくとき' do
      it 'name,contentが存在すれば登録できる' do
        @room = FactoryBot.build(:room)
        expect(@room).to be_valid
      end
    end

    #異常系
    context '新規作成がうまくいかないとき' do
      it "nameが空では作成できない" do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("ルーム名を入力してください")
      end
      it "contentが空では作成できない" do
        @room.content = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("相談内容を入力してください")
      end
    end
  end
end