Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :company do
    resources :hirings, only: [:index, :update]
  end

  resources :student_skills, only: [:new, :create]
  resources :hirings, only: [:index, :show, :update]
end
