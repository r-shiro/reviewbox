Rails.application.routes.draw do
  
  post "comments/:post_id/create" => "comments#create"
  post "comments/:post_id/destroy" => "comments#destroy"
  post "comments/:post_id/update"=>"comments#update"
  get "comments/:post_id/edit" => "comments#edit"
  
  
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  
  post "users/:id/update"=>"users#update"
  get "users/:id/edit"=>"users#edit"
  get "signup"=> "users#new"
  post "users/create"=>"users#create"
  get "users/index"=>"users#index"
  get "users/:id"=>"users#show"
  get "login"=>"users#login_form"
  post "login"=>"users#login"
  post "logout"=>"users#logout"
  get  "users/:id/likes" => "users#likes"
  get "users/:id/comments"=>"users#comments"

  
  get "/"=>"home#top"
  get "posts/index"=>"posts#index"
  get "posts/ranking"=>"posts#ranking"
  get "posts/movie"=>"posts#movie"
  get "posts/drama"=>"posts#drama"
  get "posts/anime"=>"posts#anime"
  get "posts/anime_movie"=>"posts#anime_movie"
  get "posts/book"=>"posts#book"
  get "posts/manga"=>"posts#manga"
  get "posts/ranking/movie"=>"posts#ranking_movie"
  get "posts/ranking/drama"=>"posts#ranking_drama"
  get "posts/ranking/anime"=>"posts#ranking_anime"
  get "posts/ranking/anime_movie"=>"posts#ranking_anime_movie"
  get "posts/ranking/book"=>"posts#ranking_book"
  get "posts/ranking/manga"=>"posts#ranking_manga"
  
  get "posts/new"=>"posts#new"
  post "posts/search"=>"posts#search"
  post "posts/create"=>"posts#create"
  get "posts/:id"=>"posts#show"
  get "posts/:id/edit"=>"posts#edit"
  post "posts/:id/update"=>"posts#update"
  post "posts/:id/destroy"=>"posts#destroy"
  get "posts/:id/comments"=>"posts#comments"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
