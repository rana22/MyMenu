Rails.application.routes.draw do
  root 'main#home'
  get '/home', to:'main#home'
  get '/about', to:'main#about'
  get '/contact', to:'main#contact'
  get '/menu', to:'main#menu'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  match '*unmatched', to: 'error#PageNotFound', via: :all
end
