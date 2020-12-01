Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, except: %i[update destroy edit] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: :destroy
end
