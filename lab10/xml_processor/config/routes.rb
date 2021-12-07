Rails.application.routes.draw do
  root 'processor#input'
  get 'processor/output'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
