Rails.application.routes.draw do
  resources :posts

  # DBを表示する
  get "test" => "testdbs#index"
  get "posts" => "posts#index"

  #localhost:3000が初期画面なので差し替える
  get "/" => "home#index"
  # home/topをtopとして表示する
  get "top" => "home#top"
  get "about" => "home#about"
  get "item" => "home#item"
  get "home/register" => "home#register"

  # 新規作成
  post "user_create" => "user#user_create"
  # データ編集
  # 今後対応 get
  # データ更新
  # 今後対応 patch
  # データ削除
  delete "user_destroy/:id" => "user#user_destroy"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
