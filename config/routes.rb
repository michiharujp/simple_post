Rails.application.routes.draw do
  resources :microposts do
    resources :comments
  end
  root 'microposts#index'
end
