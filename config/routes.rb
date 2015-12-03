Rails.application.routes.draw do
  resources :bikes

  root 'pages#home'

  devise_for  :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profil'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :photos

  resources :bikes do
    resources :reservations, only: [:create]
  end
  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'

end

