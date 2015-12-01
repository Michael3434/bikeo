Rails.application.routes.draw do
  resource :bikes

  root 'pages#home'

  devise_for  :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profil' },
              controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

end

