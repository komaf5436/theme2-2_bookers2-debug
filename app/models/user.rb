class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # 課題3 いいね実装 1:Nの関係によりfavoriteに対して複数のレコードを持っているためhas_manyを使用

  has_many :book_comments, dependent: :destroy
  # 課題3 コメント実装 1:Nの関係によりbook_commentに対して複数のレコードを持っているためhas_manyを使用

  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
