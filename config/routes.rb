Rails.application.routes.draw do
  resources :images
  default_url_options :host => "http://localhost:3000/"

  namespace :api, defaults: { format: :json } do
    resources :users
    resources :images
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end
