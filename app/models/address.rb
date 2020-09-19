class Address < ActiveHash::Base
  self.data = [
    { id: 1, name: '梅田' },
    { id: 2, name: '難波' },
    { id: 3, name: '天王寺' },
    { id: 4, name: '京橋' },
    { id: 5, name: '鶴橋' },
    { id: 6, name: 'その他' },
  ]
  end
