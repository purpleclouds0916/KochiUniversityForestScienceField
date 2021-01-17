Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/alumni',    to: 'alumni_messages#alumni'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   'inquiry'         => 'inquiry#index'     
  post  'inquiry/thanks'  => 'inquiry#thanks'    
  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  # post '/password_resets', to: 'password_resets#create'

 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
