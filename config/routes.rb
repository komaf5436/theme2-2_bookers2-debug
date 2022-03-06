Rails.application.routes.draw do
  root to: "homes#top"
  get "/home/about"=>"homes#about", as: "about"

  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  # 課題3 いいね実装 コメント実装 ネストする　親子関係にする
  # 課題3 いいね実装 コメント実装 投稿　削除のためcreate,destroyを使用
  # 課題3 いいね実装 単数系resourceにすることで/:idがURLに含まれなくなる
  end

end
