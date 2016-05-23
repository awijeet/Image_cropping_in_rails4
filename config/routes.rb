Rails.application.routes.draw do

  resources :blogs
  root 'blogs#index'

end
