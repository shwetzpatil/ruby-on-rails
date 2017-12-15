Rails.application.routes.draw do
  resources :products
  get '/products', to: 'products#index'

  get 'simple_pages/about'

  get 'simple_pages/contact'

  get 'simple_pages/index'
  root 'simple_pages#landing_page'

  get 'order', to: 'orders#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :orders, only: [:index, :show, :create, :destoy]
end