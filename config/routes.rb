Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]  
  resources :beans do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  get "beans_show/:id" => "beans#image_show",as: "image_bean"
  root 'beans#index'
  delete 'beans/:id' => 'beans#destroy'
end