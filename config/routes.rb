Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get  '/alumni',    to: 'alumni_messages#alumni'
  get  '/signup',  to: 'users#new'

  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
