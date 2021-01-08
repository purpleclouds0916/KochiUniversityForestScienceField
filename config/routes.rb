Rails.application.routes.draw do
  
  get 'alumni_messages/message'
  root 'static_pages#home'
  get  '/message',    to: 'alumni_messages#message'
  get  '/signup',  to: 'users#new'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
