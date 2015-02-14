Rails.application.routes.draw do
  get '/login' => 'home#login'
  post '/login' => 'home#process_login', as: 'process_login'

  resources :call_requests do
    member do
      get 'respond'
      get 'check_response'
      
      post 'process_response'
    end
  end

  root 'home#index'
end
