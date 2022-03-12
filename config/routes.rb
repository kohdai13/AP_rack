Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get   'inquiry'         => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'

  get "search" => "searches#search"

  devise_for :users

  root 'homes#top'
  get 'about' => 'homes#about'


  resources :shops, only: [:new,:index,:show,:edit,:create,:destroy,:update]do
    resource :favorites, only: [:create, :destroy]
    resources :shop_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resources :favorites, only: [:index]
  end
  #退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  #論理削除用のルーティング
  patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'


end
