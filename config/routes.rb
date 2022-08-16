Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  root 'pages#home'
  devise_for :users
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  get "user/:id", to: "user#show", as: 'user'

end
