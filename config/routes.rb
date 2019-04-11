Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/characters" => 'characters#index'
    post "/characters" => 'characters#create'
    get "/characters/:id" => 'characters#show'
    patch "/characters" => 'characters#update'
    delete "/characters" => 'characters#destroy'
  end
end
