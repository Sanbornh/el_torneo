ElTorneo::Application.routes.draw do

  root 'teams#index'

  resources :teams, only: [:index, :show, :new, :create]
  resources :ping_pong, controller: 'games', type: 'PingPong', only: [:index]
  resources :fuzz_ball, controller: 'games', type: 'FuzzBall', only: [:index]
  resources :ref_sessions, only: [:new, :create, :destroy]
  resources :tournaments, only:[:show]
  
  resources :users, only: [:index, :show] do
    member do
      post 'update_first_team_score'
      post 'update_second_team_score'
    end
  end

  # resources :costume_photos, only: [:index, :show, :new, :create, :upvote] do
  #   member do
  #     post 'upvote'
  #   end
  # end

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
