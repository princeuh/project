Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get '/about', to: 'pages#about'

  get '/contact', to: 'pages#contact'

  get '/terms', to: 'pages#terms'

   get '/privacy', to: 'pages#privacy'

   get '/enterprises', to: 'pages#enterprises'

   get '/ventures', to: 'pages#ventures'

   get '/team', to: 'pages#team'

   get '/careers', to: 'pages#careers'

   get '/apply_funding', to: 'beneficiaries#new'

   post '/get_funded', to: 'beneficiaries#create'

   get '/login', to: 'sessions#new'

   post '/login', to: 'sessions#create'

   delete '/logout', to: 'sessions#destroy'

   get '/beneficiary_login', to: 'beneficiary_sessions#new'

   post '/beneficiary_login', to: 'beneficiary_sessions#create'

   delete '/beneficiary_logout', to: 'beneficiary_sessions#destroy'

   get '/employee_login', to: 'employee_sessions#new'

   post '/employee_login', to: 'employee_sessions#create'

   delete '/employee_logout', to: 'employee_sessions#destroy'

   get '/open_account', to: 'investors#new'

   post '/open_account', to: 'investors#create'

   get '/check_out', to: 'payments#check'

   post '/process_payment', to: 'payments#check_out'

   get '/news', to: 'posts#index'

   get '/career', to: 'careers#show'

   get '/apply_career', to: 'resumes#new'

   post '/apply_career', to: 'resumes#create'

   post '/career_status', to:  'resumes#status'

   get '/status_login', to: 'status_sessions#new'

   post '/status_login', to: 'status_sessions#create'

   delete '/status_logout', to: 'status_sessions#destroy'

   get 'activate_investor', to: 'account_activations#edit_investor'

   get 'activate_beneficiary', to: 'account_activations#edit_beneficiary'



   resources :beneficiaries
   
   resources :investors do
   	 resources :proposals
   	 resources :executors
   end

   resources :employees
   resources :clubs 
   resources :club_members
   resources :club_updates
   resources :posts

   resources :careers do
      resources :resumes, only: [:index, :new, :create, :show]
   end

   resources :pages
   resources :stripe_logs, only: [:index, :new, :create]
   resources :system_logs, only: [:index, :create]
   resources :password_resets,     only: [:new, :create, :edit, :update]
   resources :news
   resources :nemabollon_files, only: [:index, :new, :create, :destroy]
end
