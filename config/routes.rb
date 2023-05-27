Rails.application.routes.draw do
  resources :selling_orders, only: [:update]
  resources :customers
  resources :inventory_purchases
  resources :providers
  resources :products
  resources :categories
  devise_for :admins,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
             },
             controllers: {
               sessions: 'admin/sessions',
               registrations: 'admin/registrations'
             }


  # Defines the root path route ("/")
  root "products#index"
end
