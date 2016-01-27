Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  devise_for :users
  # routing all different url's related to posts to the right def in posts_controller
  delete 'posts/:id' => 'posts#delete'
  post 'posts' => 'posts#create'
  get 'posts/new_post' => 'posts#new'
  
  # routing url's related to users to the right defs in posts_controller
  post 'users' => 'users#create' 
  get 'users/new' => 'users#new'
  put 'users/:id' => 'users#update'
  #routing url's related to profiles to the right defs in users_controller
  get 'profile' => 'users#profile'
  get 'profile/edit' => 'users#edit'
  put 'profile' => 'users#update'
  delete 'profile' => 'users#delete'
  # routing the different categories' url to the right def in posts_controller 
  get 'category/:cat' => 'posts#index_category'
  # routing votes + id url to def vote in votes_controller
  get 'votes/:post_id' => 'votes#vote'
  # routing the adv url to def adv in posts_controller
  get '/adv' => 'posts#adv'


  root 'posts#index'
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
