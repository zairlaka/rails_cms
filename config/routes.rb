Rails.application.routes.draw do
  
  # get 'sections/index'
  # get 'sections/show'
  # get 'sections/new'
  # get 'sections/delete'
  # get 'sections/edit'

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
  
  root 'demo#index' #no need to write demo/index only demo will do fine


  
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

  
  
  get 'demo/index' #have to write full and proper demo/index

  get 'demo/hello'
  get 'demo/other'

  # get ':controller(/:action(/:page))' 
  #this is a default routes run for anything  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
