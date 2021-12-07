Rails.application.routes.draw do
  get 'query(.:format)', to: 'lucky_nums#view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
