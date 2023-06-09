Rails.application.routes.draw do
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
  resources :selling_orders, only: [:update]
  resources :customers
  resources :balances
  resources :expenses
  resources :inventory_purchases
  resources :providers
  resources :products
  resources :homepages, only: [:index]
  resources :categories
  namespace :super_admin do
    resources :balances
    resources :admins
  end

  authenticated :admin, ->(admin) { admin.super_admin? } do
    root "super_admin/balances#index"
  end
  root "products#index", as: :admin_root
end
