Rails.application.routes.draw do
  root "categories#index"
  resources :categories
  resources :operations
  devise_for :users, path: '', path_names: { sign_in: 'login' }
end
