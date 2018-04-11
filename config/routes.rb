Rails.application.routes.draw do
  resources :sub2_line_items
  resources :sub1_line_items
  resources :line_items
  resources :products
  resources :sub2_categories
  resources :sub1_categories
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
