Rails.application.routes.draw do
  
  #devise_for :users, :controllers => { registrations: 'user/registrations' }
  #devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :users
  root to: 'phrases#index', as: :root_path

  put 'notification/read_all' => 'notification#read_all'
  
  resources :phrases do
    member do
      post :vote
    end
    resources :examples, only: [:create, :destroy] do
      post :vote
    end
  end


  resources :notifications, only: :index do
    collection do
      put :read_all
    end
  end
 
   

  root "static_pages#hello"
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
