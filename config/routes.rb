Rails.application.routes.draw do
  root to: "homes#top"
  get "/home/about"=>"homes#about", as: "about"

  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  resources :books

end

# 応用2-1 endが抜けていた
# 2-3 devise_forがresources:usersより下に記載されていたのでループしてしまっていた