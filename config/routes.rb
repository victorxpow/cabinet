Rails.application.routes.draw do
  root to: 'home#index'
  resources :documents, only: [:index, :show]
end
