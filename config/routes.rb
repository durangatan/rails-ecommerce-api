Rails.application.routes.draw do

  get '/client_token', to: 'braintree#show'
  post '/checkout', to: 'braintree#create'
  post '/login', to: 'sessions#create'

  resources :items do
    resources :categorizations
  end
  resources :categories
  resources :orders do
    resources :purchases
  end

  resources :customers
  resources :cart_additions

  put "/cart_additions", to: 'cart_additions#upsert'
end
