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

    #Background Image
    get "/background_images" => 'background_images#index'
    post "/background_images" => 'background_images#create'
    get "/background_images/:id" => 'background_images#show'
    patch "/background_images/:id" => 'background_images#update'
    delete "/background_images/:id" => 'background_images#destroy'

    #Transitions
    get "/transitions" => 'transitions#index'
    post "/transitions" => 'transitions#create'
    get "/transitions/:id" => 'transitions#show'
    patch "/transitions/:id" => 'transitions#update'
    delete "/transitions/:id" => 'transitions#destroy'

  end
end
