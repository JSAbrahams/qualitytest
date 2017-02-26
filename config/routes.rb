Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: 'pages#index', campaign: nil, userid: nil, mw: nil
  get 'pages/index/:user/:mw' => 'pages#index', user: :user, mw: :mw
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  post 'crowdsourceuser' => 'users#crowdsourceuser'
  get 'newuser' => 'users#new'
  post 'newuser' => 'users#create'
  get 'about' => 'pages#about'
  get 'intro' => 'pages#intro'
  get 'totraining' => 'pages#totraining'

  # training links
  get 'training' => 'pages#training'
  get 'training2' => 'pages#training2'
  get 'example1' => 'pages#example1'
  get 'example2' => 'pages#example2'
  get 'example3' => 'pages#example3'
  get 'example4' => 'pages#example4'
  get 'example5' => 'pages#example5'
  get 'example6' => 'pages#example6'
  get 'ready' => 'pages#ready'

  get 'trainreco' => 'pages#trainreco'
  get 'show' => 'scores#new'
  get 'checkimage' => 'scores#checkimage'
  post 'update' => 'users#update'
  get 'content' => 'users#content'
  get 'contentanswer' => 'users#contentanswer'
  get 'contentcheck' => 'scores#contentcheck'
  get 'end' => 'pages#end'
  get 'endwrong' => 'pages#endwrong'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :scores

  resources :users

  resources :campaignsets

  resources :images
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
