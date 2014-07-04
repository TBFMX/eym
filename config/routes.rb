Rails.application.routes.draw do


  get 'dashboard/index'

  get 'dashboard/login'

  get 'dashboard/equipos'

  get 'dashboard/gallerias'

  get 'dashboard/imagenes'

  get 'dashboard/videos'

  resources :discounts

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
    get ':id/galerias' => :index , :as => 'galeria_index'
    get ':equip/galerias/:id' => :show , :as => 'galeria_show'
    get ':equip/galeria_nueva/' => :new , :as => 'galeria_nueva'
    post ':equip/galeria_nueva/' => :new
    get ':equip/galeria/:id/editar' => :edit , :as => 'galeria_edit'
    post ':equip/galeria/:id/editar' => :edit
  end  
  controller :videos do
    get ':equip/:gal/videos' => :index , :as => 'video_index'
    get ':equip/:gal//videos/:id' => :show , :as => 'video_show'
    get ':equip/:gal/video_nuevo' => :new, :as => 'video_nuevo'
    post ':equip/:gal/video_nuevo' => :new
    get ':equip/:gal/:id/editar' => :new , :as => 'video_edit'
    post ':equip/:gal/:id/editar' => :new
  end  
  controller :images do
    get ':equip/:gal/imagenes' => :index, :as => 'imagen_index'
    get ':equip/:gal/imagenes/:id' => :index , :as => 'imagen_show'
    get ':equip/:gal/imagen_nueva' => :new, :as => 'imagen_nueva'
    post ':equip/:gal/imagen_nueva' => :new
    get ':equip/:gal/editar/:id' => :edit, :as => 'imagen_editar'
    post ':equip/:gal/editar/:id' => :edit
  end

  controller :comments do
    get ':id/comentarios' => :index, :as => 'comentarios_index'
    get ':equip/comentarios/:id' => :show, :as => 'comentarios_show'
    get ':id/comentario_nuevo' => :new, :as => 'comentario_nuevo'
    post ':id/comentartio_nuevo' => :new
    get ':equip/editar/:id' => :edit, :as => 'comentario_editar'
    post ':equip/editar/:id' => :edit
  end   

  controller :equipment do
    get 'venta' => :grid
    post '/equipo/contacto' => :contact
  end
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
