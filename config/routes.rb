Rails.application.routes.draw do
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'users#welcome', as: :welcome
  
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  post '/comments/create', to: 'comments#create'
  post '/portfolios/create', to: 'portfolios#create'

  resources :users, only: [:new, :show]
  resources :portfolios, only: [:index, :new, :show] do
    resources :investments, only: [:create, :new, :update, :edit]
    # get "investments/:id/sell", to: "investments#sell", as: :sell_investment

  end 
  resources :news
  resources :comments
  get '/comments/:id/edit', to: 'comments#edit'



end
