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
  post 'update' => 'users#update'
  get 'content' => 'users#content'
  get 'contentanswer' => 'users#contentanswer'

  get 'about' => 'pages#about'
  get 'intro' => 'pages#intro'
  get 'totraining' => 'pages#totraining'
  get 'trainreco' => 'pages#trainreco'
  get 'end' => 'pages#end'
  get 'endwrong' => 'pages#endwrong'

  get 'training' => 'training#training'
  get 'training2' => 'training#training2'
  get 'ready' => 'training#ready'

  get 'question' => 'question#question'
  post 'question' => 'question#question'

  get 'show' => 'images#new'
  get 'checkimage' => 'images#checkimage'
  get 'contentcheck' => 'images#contentcheck'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Go to the next page in the question. Next page depends on the filled in semantic type of the image and the current page

  resources :images

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
