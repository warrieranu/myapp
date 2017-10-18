Rails.application.routes.draw do
    root 'pages#index'
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    get 'auth/:provider/callback', to: 'sessions#create_omni_session'
    delete 'log_out', to: 'sessions#destroy', as: 'log_out'
end
