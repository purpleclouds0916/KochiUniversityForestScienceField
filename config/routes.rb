Rails.application.routes.draw do
  
  root 'static_pages#home'
  get  '/og',    to: 'static_pages#og'
  get  '/signup',  to: 'users#new'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
