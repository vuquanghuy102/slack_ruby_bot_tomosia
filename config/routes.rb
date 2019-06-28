Rails.application.routes.draw do
  namespace :admin do
    resource :profile, only: [:show, :update]
    resources :users, only: [:index, :show]
    resources :questions
    resources :answesheets
  end

  root to: "admin/answesheets#index"
  devise_for :admins
  post 'slack/button'
end
