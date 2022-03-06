class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  # 課題3 いいね実装1:Nの関係によりuserとbookに所属しているためbelongs_toを使用

end
