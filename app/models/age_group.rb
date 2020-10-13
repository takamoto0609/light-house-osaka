class AgeGroup < ActiveHash::Base
  self.data = [
    { id: 1, name: '18歳以下' },
    { id: 2, name: '19~25歳' },
    { id: 3, name: '26~30歳' },
    { id: 4, name: '31~35歳' },
    { id: 5, name: '36~40歳' },
    { id: 6, name: '41~45歳' },
    { id: 7, name: '46~50歳' },
    { id: 8, name: '51~55歳' },
    { id: 9, name: '56~60歳' },
    { id: 10, name: '61歳以上' },
  ]
end
