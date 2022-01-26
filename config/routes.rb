Rails.application.routes.draw do
  get 'relationships/following'
  get 'relationships/followers'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end

