Rails.application.routes.draw do
  
 
 
  devise_for :users
  root to: 'phrases#index', as: :root_path

  resources :phrases do
    resources :examples, only: [:create, :destroy]
  end

  root "static_pages#hello"
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
