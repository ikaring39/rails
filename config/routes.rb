Rails.application.routes.draw do
  resources :posts

  # DBを表示する
  get "test" => "testdbs#index"

  # home/topをtopとして表示する
  get "top" => "home#top"
  get "about" => "home#about"
  get "home/register" => "home#register"  
  get "posts" => "posts#index"

  post "user_create" => "user#user_create"
  post "user_delete/#{:id}" => "user#user_delete"

  # hello,world!を表示する
  # root 'application#hello'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
