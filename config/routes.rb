Rails.application.routes.draw do
  root 'billboards#index'
  
  resources :artists

  resources :billboards do
    resources :songs
  end

  
end
