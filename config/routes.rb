Rails.application.routes.draw do

  get 'hiring_checkpoints/update'

  get 'student_acceptation/:token', to: "users#update_college_acceptation", as: "student_acceptation"

  devise_for :users
  root to: 'pages#home'
  get '/legal', to: 'pages#legal', as: 'legal'

  mount Attachinary::Engine => "/attachinary"
  namespace :company do
    resources :hirings, only: [:index, :create, :update]
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
