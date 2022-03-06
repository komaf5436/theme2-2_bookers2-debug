class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  # 課題3 1:Nの関係によりfavoriteに対して複数のレコードを持っているためhas_manyを使用

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  # 課題3 Favoritesテーブル内に存在するか調べるため上記を追記
end
