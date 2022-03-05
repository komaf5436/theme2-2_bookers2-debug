class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # 応用2-21 1:Nの関係のためuserモデルに所属している形になるのでhas_manyではなく、belongs_toに変更
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
