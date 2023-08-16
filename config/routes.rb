Rails.application.routes.draw do
  root "pages#splash_screen"
  resources :categories
  resources :operations
  devise_for :users, path: '', path_names: { sign_in: 'login' }
end
