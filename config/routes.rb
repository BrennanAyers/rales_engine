Rails.application.routes.draw do
  resources :merchants, only: [:index]
  resources :customers, only: [:index]
  resources :items, only: [:index]
  resources :invoices, only: [:index]
  resources :invoice_items, only: [:index]
  resources :transactions, only: [:index]
end
