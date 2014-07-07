HousingAssociation::Application.routes.draw do  


  resources :phone_books

  resources :educations

  resources :articles

  resources :pdf_forms

  resources :circulars

  resources :comment_complaints

  resources :complaints do
    member do
      get :send_answer
      get :send_and_display_answer
    end
  end

  resources :pay_limits 
  resources :roles

  resources :slides

  resources :send_links

  resources :payments

  devise_for :views
  devise_for :users
  resources :users

  resources :links

  resources :cooperatives

  resources :messages

  resources :pictures

  resources :informs

  resources :managements
  resources :projects
  resources :pages
  root :to => 'static#index'
  get 'login' => 'users#login'
  
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
