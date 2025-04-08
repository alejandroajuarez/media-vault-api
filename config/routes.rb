Rails.application.routes.draw do
  resources :media, controller: 'media_entries'
  resources :saved, controller: 'saved_media'
  # Defines the root path route ("/")
  # root "/media#index"
  
  get "/media" => "media#index"
  get "/media/:id" => "media#show"
  patch "/media/:id" => "media#update"
  post "/media" => "media#create"
  delete "/media" => "media#destroy"

  get "/saved" => "saved#index"
  get "/saved/:id" => "saved#show"
  patch "/saved/:id" => "saved#update"
  post "/saved" => "saved#create"
  delete "/saved" => "saved#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
end