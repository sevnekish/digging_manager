Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tickets, only: [:create]
    end
  end
end
