Rails.application.routes.draw do
  resources :posts

  # DBを表示する
  get "test" => "testdbs#index"
  get "manual" => "manual#index"

  #localhost:3000が初期画面なので差し替える
  get "/" => "home#index"
  # home/topをtopとして表示する
  get "top" => "home#top"
  get "about" => "home#about"
  get "item" => "home#item"
  get "home/register" => "home#register"  
  get "posts" => "posts#index"
  post "user_create" => "user#user_create"
  get "user_delete/:id" => "user#user_delete"

  post "data" => "data#regist"
  get "data/:id" => "data#show"
  put "data/:id" => "data#update"
  delete "data/:id" => "data#destroy"

  # hello,world!を表示する
  # root 'application#hello'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
