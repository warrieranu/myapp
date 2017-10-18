Rails.application.routes.draw do
    root 'pages#index'
    resources :users
    resources :sessions
    resources :courses, only:[:show]
    
    get 'auth/:provider/callback' => 'sessions#create_omni_session'
    get 'auth/failure' => redirect('/')
    get 'log_out' => 'sessions#destroy', :as => 'log_out'
    
    
end
