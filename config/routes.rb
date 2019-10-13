Rails.application.routes.draw do
  
  devise_for :users
  root to: 'phrases#index', as: :root_path

  get 'phrases/new'
  get 'phrases/create'
  get 'phrases/index'

  root "static_pages#hello"

  resource :phrases

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
