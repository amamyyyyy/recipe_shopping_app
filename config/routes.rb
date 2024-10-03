Rails.application.routes.draw do
  get 'recipes/index'
  root to: "recipes#index"
  devise_for :users
  
end
