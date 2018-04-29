Rails.application.routes.draw do


  root 'pages#home'

  get  '/about', to: 'pages#about'

  get '/enterprise', to: 'pages#enterprises'

  get '/ventures', to: 'pages#ventures'

  get  '/team', to: 'pages#team'

  get  '/terms', to: 'pages#terms'

  get  '/privacy', to: 'pages#privacy'

  get '/careers', to: 'pages#careers'

  get '/contact', to: 'pages#contact'

  get  '/open_account', to: 'investors#new'


  resources :investors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
