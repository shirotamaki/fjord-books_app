Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    resources :following, only: %i(index create)
    resources :followers, only: :index
  end

  resources :relationships, only: %i(create destroy)
end
