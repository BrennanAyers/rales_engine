Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'revenue#index'
        get '/:id/revenue', to: 'revenue#show'
        get '/:id/favorite_customer', to: 'favorite_customer#show'

        get '/find', to: 'find#show'
      end

      namespace :customers do
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'

        get '/find', to: 'find#show'
      end

      namespace :items do
        get 'most_revenue', to: 'most_revenue#index'
        get 'most_items', to: 'most_items#index'
        get '/:id/best_day', to: 'best_day#show'

        get '/find', to: 'find#show'
      end

      namespace :invoices do
        get '/find', to: 'find#show'
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
      end

      namespace :transactions do
        get '/find', to: 'find#show'
      end
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
