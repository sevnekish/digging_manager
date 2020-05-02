Rails.application.routes.draw do
  root to: 'tickets#index'

  resources :tickets, only: %i[index show]

  namespace :api do
    namespace :v1 do
      resources :tickets, only: %i[create]
    end
  end
end
