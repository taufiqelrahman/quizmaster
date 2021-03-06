Rails.application.routes.draw do



  authenticate :user do
    resources :results
    resources :histories
    resources :questions
    get 'elearning/question'
    get 'elearning/result'
    get 'dashboard/index'
    get 'dashboard/get_stat'
    get 'dashboard/get_history'
    get 'dashboard/get_result'
    get 'question_groups/list'
    get 'question_sets/list'
  end
  devise_for :users
  resources :question_sets
  resources :question_groups
  devise_scope :user do
    get 'login' => 'devise/sessions#new'
  end
  # devise_for :users, controller: {
  #   sessions: 'users/registrations'
  # }

  #elearning
  get 'elearning/start'
  get 'elearning/list'
  get 'start' => 'elearning#start'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'elearning#start'

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
