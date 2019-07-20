Rails.application.routes.draw do
  root 'demo#index' #no need to write demo/index only demo will do fine
  get 'demo/index' #have to write full and proper demo/index

  get 'demo/hello'
  get 'demo/other'

  # get ':controller(/:action(/:page))' 
  #this is a default routes run for anything  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
