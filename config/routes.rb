Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  resources :users
  resources :sessions

  match('posts/:id/add_point', {:via => :get, :to => 'posts#add_point'})

  root :to => 'posts#index'
end
