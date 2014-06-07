Rails.application.routes.draw do
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  
  root to: "sessions#new"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :items
  resources :twitter do
    collection do
      get  :login
    end
  end

  get "twitter/login"

	get "github_auth" => "github#authenticate"
	get "github_auth/callback" => "github#callback"
	post "create_gist" => "github#create_gist"

  get 'dropbox_auth' => 'dropbox#authenticate'
  post 'dropbox_auth/callback' => 'dropbox#callback'
  post 'dropbox/upload' => 'dropbox#upload'
  get 'dropbox/upload_file' => 'dropbox#upload_file'

  get '/auth/:facebook/callback', to: 'items#index'
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
