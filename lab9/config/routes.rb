Rails.application.routes.draw do
  root 'lucky_nums#input'
  post 'lucky_nums/view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
