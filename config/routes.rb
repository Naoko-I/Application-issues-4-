Rails.application.routes.draw do
  # get 'relationships/create'
  # get 'relationships/destroy'
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
  	  resource :relationships, only: [:create, :destroy]
  end
  resources :books
  get 'users/:user_id/follows' => 'relationships#follows', as: "follows"
  get 'users/:user_id/followers' => 'relationships#followers', as: "followers"

end
