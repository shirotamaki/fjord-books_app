Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books

  resources :users, only: %i(index show) do
    resources :followed_users, only: %i(index create update)
    resources :follower_users, only: :index
  end

  resources :relationships, only: %i(create destroy) do
    resources :followed_users, only: :create
  end

end

# => ["id", "follower_id", "followed_id", "created_at", "updated_at"]