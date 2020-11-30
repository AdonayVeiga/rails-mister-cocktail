Rails.application.routes.draw do
  resources :cocktails, except: %i[update destroy edit]
end
