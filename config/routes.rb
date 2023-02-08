Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/author/home", to:"authors#home"
  post "/author/create", to:"authors#create"
  get "/author/show", to:"authors#show"
  get "/author/show/booksByAuthor", to:"authors#show"
  put "/author/update", to:"authors#update"
  delete "/author/delete", to:"authors#delete"

  get "/book/home", to:"books#home"
  post "/book/create", to:"books#create"
  get "/book/show", to:"books#show"
  put "/book/update", to:"books#update"
  delete "/book/delete", to:"books#delete"
end
