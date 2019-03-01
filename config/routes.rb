Rails.application.routes.draw do
  
  
  resources :artists do
    resources :songs
  end

  resources :billboards do
    resources :songs
  end
  
end
