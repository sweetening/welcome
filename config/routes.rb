Rails.application.routes.draw do
  root to: 'pages#home'
  get "components", to: 'pages#components'
  devise_for :users

  # do
  # get 'logout' => 'devise/sessions#destroy'
  # end
  
  resources :mentors do
    resources :consultations, only: [:new, :create]
  end

  resources :consultations, only: [:edit, :update, :show]

  resources :consultations, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :dashboard, only: [:index]

  resources :articles do
    resources :comments, only: [:new, :create]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end



