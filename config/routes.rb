Rails.application.routes.draw do
  resources :media, controller: 'media_entries'
  # Defines the root path route ("/")
  # root "/media#index"
  
  get "/media" => "media#index"
  get "/media/:id" => "media#show"
  patch "/media/:id" => "media#update"
  post "/media" => "media#create"
  delete "/media" => "media#destroy"

end