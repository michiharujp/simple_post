Rails.application.routes.draw do
  resources :microposts
  root 'microposts#index'
end
