Rails.application.routes.draw do
  devise_for :customers
  resources :items do
    resources :categorizations
  end
  resources :categories
  resources :orders do
    resources :purchases
  end
  resources :customers do
    resources :postal_addresses
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
