Rails.application.routes.draw do

  get '/client_token', to: 'braintree#show'
  post '/checkout', to: 'braintree#create'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :items do
    resources :categorizations
  end
  resources :categories
  resources :orders do
    resources :purchases
  end

  resources :customers do
    resources :cart_additions
  end


  resources :cart_additions

  put "/cart_additions", to: 'cart_additions#upsert'
end
