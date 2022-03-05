class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  # 応用2-9 1:Nの関係でuserは複数のレコードを持っていることになるのでbelongs_toをhas_manyに変更
  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
# 応用2-24 入力チェックであるバリデーションにintroductionが設定されていないので追記


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
