Rails.application.routes.draw do
  root "pages#splash_screen"
  resources :categories, only: [:index, :show, :new, :create] do
    resources :operations, only: [:new, :create]
  end
  devise_for :users, path: '', path_names: { sign_in: 'login' }
end
