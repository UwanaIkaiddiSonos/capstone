Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # Characters
    get "/characters" => 'characters#index'
    post "/characters" => 'characters#create'
    get "/characters/:id" => 'characters#show'
    patch "/characters/:id" => 'characters#update'
    delete "/characters/:id" => 'characters#destroy'

    # Labels
    get "/labels" => 'labels#index'
    post "/labels" => 'labels#create'
    get "/labels/:id" => 'labels#show'
    patch "/labels/:id" => 'labels#update'
    delete "/labels/:id" => 'labels#destroy'
  end
end
