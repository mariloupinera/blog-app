Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  root 'pages#index'
    get 'about', to: 'pages#about', as: :about
    get 'contact', to: 'pages#contact', as: :contact
    get 'signup', to: 'users#new'

  resources :users, except: [:new]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
end
