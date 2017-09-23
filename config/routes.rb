Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  namespace :company do
    resources :hirings, only: [:index]
    resources :student_hirings, only: [:update]
  end
  resources :skills, only: [:show]
  resources :student_skills, only: [:new, :create]
  resources :hirings, only: [:index, :show, :update]
end
