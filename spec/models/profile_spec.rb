require 'rails_helper'

RSpec.describe Profile do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィール新規作成' do
    #正常系
    context '新規作成がうまくいくとき' do
      it 'sex_id, blood_type_id, birth_day, zodiac_sign_id, age_group_id, address_id, occupation_id, work_place, summaryが存在すれば登録できる' do
        @profile = FactoryBot.build(:profile)
        expect(@profile).to be_valid
      end
    end

    #異常系
    context '新規作成がうまくいかないとき' do
      it "sex_idが空では作成できない" do
        @profile.sex_id = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("性別を入力してください")
      end
      it "blood_type_idが空では作成できない" do
        @profile.blood_type_id = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("血液型を入力してください")
      end
      it "birth_dayが空では作成できない" do
        @profile.birth_day = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("生年月日を入力してください")
      end
      it "zodiac_sign_idが空では作成できない" do
        @profile.zodiac_sign_id = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("星座を入力してください")
      end
      it "age_group_idが空では作成できない" do
        @profile.age_group_id = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("年齢を入力してください")
      end
      it "address_idが空では作成できない" do
        @profile.address_id = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("住んでいる地域を入力してください")
      end
      it "occupation_idが空では作成できない" do
        @profile.occupation_id= ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("職業を入力してください")
      end
      it "work_placeが空では作成できない" do
        @profile.work_place = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("職種を入力してください")
      end
      it "summaryが空では作成できない" do
        @profile.summary = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("自己紹介を入力してください")
      end
    end
  end
end
