Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  namespace :company do
    resources :hirings, only: [:index]
    resources :student_hirings, only: [:update]
  end

  resources :skills, only: [ :show ] do
    resources :student_skills, only: [ :create]
  end
  
  resources :hirings, only: [:index, :show, :update]
end
