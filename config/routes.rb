Rails.application.routes.draw do
  
# default routes given to us for resources  
# resources :portfolios

#we want all of the resource routes expect show. Changing show route to be singular not plural.
#as: is renaming route name
resources :portfolios, except: [:show]
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

  #setting root home route
  root to: 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
