Rails.application.routes.draw do
  resources :categories
  resources :subjects
  resources :courses
  resources :instructors
  resources :users
  root 'welcome#index'
  get '/signup', to:'users#new'
  get '/dashboard', to:'users#show'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/search', to: 'do_search#new'
  get '/display', to: 'do_search#display'
  # get '/display/:id', to: 'do_search#display'
 
  get '/enroll', to: 'enrollments#enroll'
  delete '/drop', to: 'enrollments#drop'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
