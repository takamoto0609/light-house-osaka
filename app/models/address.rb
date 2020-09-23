class Address < ActiveHash::Base
  self.data = [
    { id: 1, name: '大阪市' },
    { id: 2, name: '豊中・池田・高槻' },
    { id: 3, name: '北河内・東大阪' },
    { id: 4, name: '南河内' },
    { id: 5, name: '堺・泉南' },
    { id: 6, name: 'その他' },
  ]
  end
