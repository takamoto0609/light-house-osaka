class AgeGroup < ActiveHash::Base
  self.data = [
    { id: 1, name: '18歳以下' },
    { id: 2, name: '19~29歳' },
    { id: 3, name: '30~39歳' },
    { id: 4, name: '40~49歳' },
    { id: 5, name: '50~59歳' },
    { id: 6, name: '60歳以上' },
  ]
end
