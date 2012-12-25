Necklace::Application.routes.draw do
  devise_for :users

  resources :products

  namespace :admin do
  	resources :products, :controller => "products"

  	root :to => "products#index"
  end

  root :to => "products#index"

end
