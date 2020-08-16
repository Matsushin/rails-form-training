Rails.application.routes.draw do
  root 'tasks#index'

  get '/health_check', to: "health_check#index"
  resources :tasks
end
