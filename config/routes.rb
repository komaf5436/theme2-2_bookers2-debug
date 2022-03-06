Rails.application.routes.draw do
  root to: "homes#top"
  get "/home/about"=>"homes#about", as: "about"

  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  resources :books do
   resource :favorites, only:[:create, :destroy]
  # 課題3 ネストする　親子関係にする
  # 課題3 単数系resourceにすることで/:idがURLに含まれなくなる
  end

end
