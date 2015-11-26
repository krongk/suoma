Rails.application.routes.draw do
  resources :vouchers
  
  resources :traveller_groups do 
    resources :travellers
  end
  
  resources :guides
  
  resources :agencies do 
    resources :agency_contacts
  end

  resources :trips
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
