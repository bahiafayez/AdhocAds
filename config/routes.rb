Appv3::Application.routes.draw do
  
  scope '/backend' do
    devise_for :administrators, :registration => 'register' #, :controllers => { :sessions => "backend/sessions" }
  end
  
  get "home/index"

  get "streams/index", :as => 'streams'

  get "streams/show", :as => 'show_stream'

  namespace :backend do
    root to: "ads#index"
    resources :proxies
    resources :ad_slots
    resources :online_users
    resources :tags
    resources :ads
    resources :stream_slots
    resources :live_streams
    
    #resources :ad_user #should add this too
  end


  

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  

  get "sessions/new"

  get "sessions/create"

  get "sessions/destory"

  root :to => 'sessions#new'

  #match 'sessions/callback' => 'sessions#callback', :as => 'callback' 
  
  controller :sessions do
    get 'login' => :new
    get 'callback' => :callback
    #post 'login' => :create
    delete 'logout' => :destroy  #ana 3amlaha delete.. therefore in link to pass delete method.. if was get then in link_to dont pass anything like the admission application
  end
  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
