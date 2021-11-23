Rails.application.routes.draw do
  root 'calc#input'
  post 'calc/output'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
