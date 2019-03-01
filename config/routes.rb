Rails.application.routes.draw do
  
  get 'songs/index'
  get 'songs/show'
  get 'songs/new'
  resources :artists

  resources :billboards
  
end
