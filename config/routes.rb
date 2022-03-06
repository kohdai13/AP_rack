Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'about' => 'homes#about'
  
  
  resources :shops, only: [:index,:show,:edit,:create,:destroy,:update]do
    resource :favorites, only: [:create, :destroy]
    resources :shop_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:index,:show,:edit,:update]
  
  
end
