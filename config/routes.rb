Rails.application.routes.draw do
  
 
  # get 'users/index'
  # get 'users/:id', to: 'users#show', as: :users_show_path
  devise_for :users
  root to: 'phrases#index', as: :root_path

  # get 'phrases/new'
  # get 'phrases/create'
  # get 'phrases/index'

  root "static_pages#hello"
  resources :users
  resources :phrases
  resources :example
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
