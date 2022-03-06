class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  # 課題3 1:Nの関係によりuserとbookに所属しているためbelongs_toを使用

end
