Rails.application.routes.draw do
  get 'friendships/following'
  get 'friendships/followers'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    member do
      get :following, :followers
    end
  end
  resources :friendships, only: %i(create destroy)
end
