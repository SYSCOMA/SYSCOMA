Rails.application.routes.draw do

  resources :competence_matrices do
    resources :abilities, only: [:edit, :update]
  end

  resources :groups do
    get 'subgroup', to: 'groups#new'
    get 'employee', to: 'groups#search_employee'
    delete 'employee/:id', to: 'groups#remove_employee'
    post 'employee/:id', to: 'groups#add_employee'
    get 'manager', to: 'groups#search_manager'
    delete 'manager', to: 'groups#remove_manager'
    post 'manager/:id', to: 'groups#add_manager'
  end

  namespace :competences do
    get 'edit/:id', action: 'edit_matrix',
        as: 'edit_matrix'
    get 'edit/:id/:matrix_id', action: 'edit_knowledge_area', 
        as: 'edit_knowledge_area'
    get 'edit/:id/:matrix_id/:knowledge_area_id', action: 'edit',
        as: 'edit'
    post 'save/:id/:matrix_id/:knowledge_area_id', action: 'save', as: 'save'
  end

  devise_for :users
  
  #get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:id/matrix/:matrix_id', to: 'users#show_matrix', as: 'user_matrix'
  resources :users, except: :create
  post 'users/create', to: 'users#create', as: 'create_user'

  #get 'users', to: 'users#index', as: 'users'
  #get 'users/new', to: 'users#new', as: 'new_user'
  #post 'users/create', to: 'users#index', as: 'users'
  #edit update

  namespace :search do
    get 'new', action: 'new'
    post 'criteria', action: 'criteria', as: 'criteria'
    post 'search', action: 'search', as: ''
    post 'saved', action: 'saved', as: 'saved'
  end


  get 'welcome/index'

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
