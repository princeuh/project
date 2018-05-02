Rails.application.routes.draw do

  root 'pages#home'

  get  '/about', to: 'pages#about'

  get '/enterprise', to: 'pages#enterprises'

  get '/ventures', to: 'pages#ventures'

  get  '/team', to: 'pages#team'

  get  '/terms', to: 'pages#terms'

  get  '/privacy', to: 'pages#privacy'

  get '/careers', to: 'pages#careers'

  get '/contact_us', to: 'pages#contact'

  get  '/open_account', to: 'investors#new'

  post  '/open_account', to: 'investors#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/all_careers', to: 'careers#index'

  post '/contact', to: 'contacts#create'

  get  '/employee_account', to: 'employees#new'

  post '/employee_account', to: 'employees#create'

  get '/employee_login', to: 'employee_sessions#new'

  post '/employee_login', to: 'employee_sessions#create'

  delete '/employee_logout', to: 'employee_sessions#destroy'

  get '/get_funded', to: 'beneficiaries#new'

  post '/get_funded', to: 'beneficiaries#create'

  resources :investors do
    resources :executors, only: [:create, :edit, :update, :destroy]
    resources :proposals
  end

  resources :careers
  resources :contacts
  resources :employees
  resources :beneficiaries

  resources :clubs
  resources :club_members, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
