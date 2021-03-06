Rails.application.routes.draw do
  # after we ran a --   rails g controller Topics index show   it generated these routes
  # get 'topics/index'
  # get 'topics/show'

  # we are changing it to this route
  resources :topics, only: [:index, :show]

  devise_for :users
  # default routes given to us for resources  
  # resources :portfolios
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  #we want all of the resource routes expect show. Changing show route to be singular not plural.
  #as: is renaming route name
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # default routes given to us:
  # get 'pages/home'
  # get 'pages/about'
  # get 'pages/contact'
  #changes the default routes to be more simple.
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  #default resource route
  #resources :blogs
  #we want to make it more custom
  resources :blogs do
    member do 
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
