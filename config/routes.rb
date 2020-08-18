Rails.application.routes.draw do
  devise_for :users
  # 追記する
  resources :blogs
end
