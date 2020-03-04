Rails.application.routes.draw do
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'users#welcome'
  


  resources :users
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :portfolios do
    resources :investments, only: [:index, :create, :new, :show, :update, :edit]
    # get "investments/:id/sell", to: "investments#sell", as: :sell_investment

  end 
  resources :news
  resources :comments
  get '/comments/:id/edit', to: 'comments#edit'



end
