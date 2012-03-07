KwEcovita::Application.routes.draw do |map|
  get "ratings/create"

  namespace(:admin){
    resources :gifts
    resources :users
    resources :orders
    resources :order_products
    resources :product_comments
    resources(:pages){
      resources(:galleries){
        resources :gallery_images
      }
    }
    resources :page_banners
    resources(:banner_categories){
      resources :banners
    }
    #resources :product_recommendeds
    resources(:categories){
      resources(:subcategories){
        resources(:products){
          resources :product_comments
          resources :product_images
        }
      }
    }
    resources :searchs  do
      collection do
        get 'results'
        get 'resend' 
        get 'details'  
      end
    end
    
    root :to => "categories#index"
  }
  
  resources(:carrinhos){
    collection do
      get :empty_cart
    end
  }
  
  resources :home
  resources(:produtos){
    member do
      get :add_to_cart
      get :remove_from_cart
      get :add_to_wishlist
      get :remove_from_wishlist
    end
  }
  resources :search  do
    collection do
      get 'results'
    end
  end  
  resources :orders
  resources :sitecontacts
  resources :terms
  resources :politics
  resources :deliveries
  resources :product_comments
  resources :categorias
  resources :ratings
  resources :accounts
  resources :banners
  resources :subcategorias
  resources(:wishlists)
  resources :users
  resources :myorders
  resources(:user_sessions){
    collection do
      get :logado
    end
  }
  resources(:payments){
    collection do
      post :efetuado
      get :efetuado
    end
  }
  resources :password_resets
    
  get "static_content/denied"
  get "static_content/index"

  root :to => "home#index"
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
  
  root :controller => "static_content", :action => "index"

  post "pagseguro_developer", :to => "pag_seguro/developer#create"
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
end
