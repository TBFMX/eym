Rails.application.routes.draw do


  resources :categories

  resources :brands

  resources :packages

  resources :comments

  resources :videos

  resources :images

  resources :galleries

  resources :equipment


  get 'welcome/index'

  resources :module5s

  resources :module4s

  resources :module3s

  resources :module2s

  resources :module1s

  get 'password_resets/new'

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new 
    post 'login' => :create
    delete 'logout' => :destroy
  end

  controller :welcome do
    get 'welcome/index' => :new
    post 'welcome/index' => :create
    delete 'welcome/index' => :destroy
    delete 'welcome/logout' => :destroy
    #post '/' => :create
    #delete '/' => :destroy
    #delete '/logout' => :destroy
  end
  
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :welcome

  resources :users

  resources :rols

  resources :password_resets

  controller :users do
    get 'recover_password' => :recover_password
    post 'recover_password' => :recover_password 
    get 'new_recover_password' => :new_recover_password
    post 'new_recover_password' => :new_recover_password 
    get 'cambiar_password' => :cambiar_password
    post 'cambiar_password' => :cambiar_password
    get 'new_cambiar_password' => :new_cambiar_password
    post 'new_cambiar_password' => :new_cambiar_password
  end 


  #preparacion para usar rutas amigables o traducidas segun se ocupe

  controller :galleries do
    get 'equipment/galleries/:id' => :index
    get 'galleries/new/:id' => :new
    post 'galleries/new/:id' => :new
    get 'galleries/:id/edit/:equip' => :new
    post 'galleries/:id/edit/:equip' => :new
  end  
  controller :videos do
    get 'galleries/videos/:id' => :index
    get 'videos/new/:id' => :new
    post 'videos/new/:id' => :new
    get 'videos/:id/edit/:equip' => :new
    post 'videos/:id/edit/:equip' => :new
  end  
  controller :images do
    get 'galleries/images/:id' => :index
    get 'images/new/:id' => :new
    post 'images/new/:id' => :new
    get 'images/:id/edit/:equip' => :edit
    post 'images/:id/edit/:equip' => :edit
  end
=begin  
  controller :comments do
    get 'equipment/comments/:id' => :index    
    get 'comments/new/:id' => :new
    post 'comments/new/:id' => :new
    get 'comments/:id/edit/:equip' => :edit
    post 'comments/:id/edit/:equip' => :edit
  end   
=end  


  #get '*unmatched_route', :to => 'application#raise_not_found2'


  #get 'welcome' => 'index#welcome'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
