Necklace::Application.routes.draw do
  devise_for :users

	resources :categories do
  	resources :products
	end

  namespace :admin do
  	resources :categories do
	  	resources :products, :controller => "products"
	  end

  	root :to => "products#index"
  end

  root :to => "products#index"

  mount Ckeditor::Engine => "/ckeditor"

end
