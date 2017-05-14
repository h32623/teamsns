Rails.application.routes.draw do
  get 'home/index'
  
  get 'home/post_write' 
  post '/write' => 'home#write'
  
  get '/post_title/:p_id'  => 'home#post_title'
  
  get '/update/:p_id' => 'home#update'
  post '/update/:p_id' => 'home#update_post'
  
  get '/destroy/:p_id' => 'home#destroy'
  
  get '/:p_id/post_like' => 'home#post_like'
  
  post '/:p_id/comment_create' => 'home#comment_create'
  
  get '/:p_id/comment_update/:c_id' => 'home#comment_update'
  post '/:p_id/comment_update/:c_id' => 'home#comment_update_post'
  
  get '/:p_id/comment_destroy/:c_id' => 'home#comment_destroy'
  
  
  get '/:p_id/like' => 'home#like'
  get '/:p_id/like/:l_id' => 'home#like'
  
  get '/mail/:p_id' => 'home#mail'
  post '/mail_write' => 'home#mail_write'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
