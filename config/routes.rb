Rails.application.routes.draw do
  resources :families
  resources :gizmos

  root :to => redirect('/families')
end
