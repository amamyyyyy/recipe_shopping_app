Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index'
  root to: "recipes#index"
  resources :recipes do
    get 'shopping_list', on: :collection
  end
  
  
end
