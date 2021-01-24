Rails.application.routes.draw do
  # get '/posts', to: 'posts#index'
  # get 'posts/new', to: 'posts#new'
  # post 'posts/create', to: 'posts#create'
  root 'static_pages#home'
  get  '/alumni',    to: 'static_pages#alumni'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   'inquiry'         => 'inquiry#index'     
  post  'inquiry/thanks'  => 'inquiry#thanks'    
  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :posts
  # post '/password_resets', to: 'password_resets#create'

 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
