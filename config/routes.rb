Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/characters" => 'characters#index'
    post "/characters" => 'characters#create'
    get "/characters/:id" => 'characters#show'
    patch "/characters/:id" => 'characters#update'
    delete "/characters/:id" => 'characters#destroy'
  end
end
