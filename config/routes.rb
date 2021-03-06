Analysistool::Application.routes.draw do
  #get "locations/index"
  #
  #get "locations/new"
  #
  #get "locations/show"
  #
  #get "locations/edit"

  scope path: '/locations', controller: :locations do
    get 'show_near' => :show_near
    post 'show_near' => :show_near
    get 'convex_hull' => :convex_hull
    get 'visited_locations' => :visited_locations
    post 'visited_locations' => :visited_locations
  end

  scope path: '/gps_samples', controller: :gps_samples do
    get 'user_mobility' => :user_mobility
    post 'user_mobility' => :post_user_mobility
  end

  resources :locations do
    collection do
      get :destroy_all
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
