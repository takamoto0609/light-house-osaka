class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '公務員' },
    { id: 2, name: '警察官' },
    { id: 3, name: '自衛官' },
    { id: 4, name: '正社員' },
    { id: 5, name: '派遣社員' },
    { id: 6, name: 'アルバイト' },
    { id: 7, name: '自営業' },
    { id: 8, name: 'その他' },
  ]
  end
