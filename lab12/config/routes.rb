Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'lucky_nums#input'
  match 'lucky_nums/output', via: %I[get post]
  get 'lucky_nums/data'
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
