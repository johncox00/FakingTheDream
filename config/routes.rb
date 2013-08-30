FakingTheDream::Application.routes.draw do
  
  


  resources :tour_dates

  resources :venues

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  get "home/index"

  root :to => "home#current"

  match 'song/:id' => 'home#song'

  match 'current' => 'home#current'

  match 'dates' => 'home#dates'

  match 'live' => 'home#live'

  match 'admin/current' => 'home#current'

  match 'songlist' => 'home#songlist'

  match 'get_current_song_id' => 'home#get_current_song_id'
  match 'admin/get_current_song_id' => 'home#get_current_song_id'

  match 'create_request' => 'home#create_request'

  match 'admin/dashboard/set_current_song' => "admin#set_current_song"#. :via => [:post]
  match '/admin/dashboard/start_light_show' => "admin#start_light_show"

  match 'admin/dashboard/ignore_request' => 'admin#ignore_request'

  match 'admin/dashboard/get_requests_grouped_by_song' => 'admin#get_requests_grouped_by_song'

  match 'admin/dashboard/delete_requests_by_song' => 'admin#delete_requests_by_song'

  match 'admin/dashboard' => "admin#dashboard"

  resources :songs,:path => "/admin/songs"

  resources :artists, :path => "/admin/artists"

  resources :lightshows, :path => "/admin/lightshows"


  resources :light_show_segments, :path => "/admin/light_show_segments"


  resources :light_effects, :path => "/admin/light_effects"


  resources :tags

  resources :genres


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
