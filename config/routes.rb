Rails.application.routes.draw do
  
  get 'billboards/index'
  get 'billboards/show'
  get 'billboards/new'
  resources :artists
  
end
