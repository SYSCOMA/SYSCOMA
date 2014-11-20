Rails.application.routes.draw do

  resources :competence_matrices do
    resources :abilities, only: [:edit] do
      post 'create', to: 'abilities#create', as: 'create'
      post 'update/:id', to: 'abilities#update', as: 'update'
      #delete 'values/:id', to: 'competence_matrices#value', as: 'destroy_value'
      get 'values/:id', to: 'competence_matrices#users', as: 'value_users'
    end
    delete 'abilities/:id', to: 'competence_matrices#destroy_ability', as: 'destroy_ability'
    delete 'knowledge_areas/:id', to: 'competence_matrices#destroy_knowledge_area', as: 'destroy_knowledge_area'
    delete 'values/:id', to: 'competence_matrices#destroy_value', as: 'destroy_value'
    get 'users', to: 'competence_matrices#users', as: 'users'
    get 'users/abilities/:ability_id', to: 'competence_matrices#users', as: 'ability_users'
    get 'users/knowledge_areas/:knowledge_area_id', to: 'competence_matrices#users', as: 'knowledge_area_users'
    get 'users/values/:value_id', to: 'competence_matrices#users', as: 'value_users'
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
    post 'knowledge_area_ability_and_operator_step', action: 'knowledge_area_ability_and_operator_step', as: 'knowledge_area_ability_and_operator_step'
    post 'value_step', action: 'value_step', as: 'value_step'
    post 'add_element', action: 'add_element', as: 'add_element'
    post 'add_saved', action: 'add_saved', as: 'add_saved'
    post 'search', action: 'search', as: ''
    post 'save', action: 'save', as: 'save'
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
