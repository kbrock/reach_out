Rails.application.routes.draw do
  resources :families
  resources :gizmos

  root "home#index"
end
