Bookstore::Application.routes.draw do
  
  get "sessions/new"

  get "users/new"
  
  resources :books
  resources :authors
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :orders
  
  match '/books_search',  :to => 'shop#books_search'
  match '/authors_search', :to => 'shop#authors_search'
  
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  match '/checkout', :to => 'orders#checkout'
  match '/done', :to => 'orders#done'

  match '/signup',  :to => 'users#new'
  match '/add_to_cart', :to => 'shop#add_to_cart'
  match '/clear_cart', :to => 'shop#clear_cart'
  match '/view_cart', :to => 'shop#view_cart'
  
	match '/watch_video', :to => 'shop#watch_video'
  match '/home_index', :to => 'shop#index'
  
  root :to => "shop#index"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
