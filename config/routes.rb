Rails.application.routes.draw do
  get 'questionaire/:token/new' => 'questionaire#new'
  post 'questionaire/create'
  get 'questionaire/show'
  get 'questionaire/notfound'

  root 'dashboard#index'
  get 'dashboard/index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'login' => 'sessions#destroy', as: :delete_login
  get 'login/edit' => 'sessions#edit', as: :edit_login
  patch 'login' => 'sessions#update'
  put 'login' => 'sessions#update'

  get 'signup' => 'authors#new'
  post 'signup' => 'authors#create', as: :authors
  delete 'signup' => 'authors#destroy'
  get 'profile' => 'authors#edit', as: :edit_profile
  patch 'profile' => 'authors#update', as: :author

  resources :surveys, except: [:index]
  patch 'publish/:id' => 'surveys#publish', as: :publish
  patch 'unpublish/:id' => 'surveys#unpublish', as: :unpublish
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
