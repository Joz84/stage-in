Rails.application.routes.draw do

  get 'hiring_checkpoints/update'

  root to: 'pages#home'
  get 'redirect_to_inscription', to: 'pages#redirect_to_inscription'

  mount Attachinary::Engine => "/attachinary"

  # INSCRIPTION
  devise_for :users, controllers: { registrations: "my_registrations" }

  resources :users, only: [:new]

  namespace :company do
    resources :hirings, only: [:index, :create, :destroy]
    resources :student_hirings, only: [:update]
  end

  resources :skills, only: [:show] do
    resources :student_skills, only: [:new, :create]
  end
  resources :hirings, only: [:index, :show], shallow: true do
    resources :student_hirings, only: [:show, :create]
  end
  resources :hiring_checkpoints, only: [:update]
  resources :hirings, only: [:index, :show, :update]

end
