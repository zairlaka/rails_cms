Rails.application.routes.draw do
  
  
  root 'public#index'
  get 'show/:permalink', :to => 'public#show', :as => "public_show"
  get 'admin_users/index'
  get 'admin_users/new'
  get 'admin_users/edit'
  get 'admin_users/delete'


  root 'demo#index' #no need to write demo/index only demo will do fine
  get 'demo/index' #have to write full and proper demo/index

  get 'demo/hello'
  get 'demo/other'

  get 'admin', :to => 'access#menu'
  get 'access/menu' #index
  get 'access/login' #new
  post 'access/attempt_login' # create POST
  get 'access/logout' #destroy
  
  
  # get 'admin_users/index'
  # get 'admin_users/new'
  # get 'admin_users/edit'
  # get 'admin_users/delete'

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end


  # get ':controller(/:action(/:page))' 
  #this is a default routes run for anything  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



#these are match routes 
  # get 'sections/index'
  # get 'sections/show'
  # get 'sections/new'
  # get 'sections/delete'
  # get 'sections/edit'
#these are resource routes 
  resources :sections do
    member do
      get :delete
    end 
  end 
  # get 'pages/index'
  # get 'pages/show'
  # get 'pages/new'
  # get 'pages/edit'
  # get 'pages/delete'
  resources :pages do
    member do
      get :delete
    end 
  end 
  
  


  
  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete' # automatically generated no need instead we use 
  resources :subjects do #by defualt delete is not included in it so thats why we include it explicity 
    member do
      get :delete 
      #delete_subject GET    /subjects/:id/delete(.:format)       subjects#delete
    end
  end


end
