Rails.application.routes.draw do
  namespace :admin do
    get 'profile' => 'admins#show'
    resources :users
    resources :questions
    resources :answers
    resources :answesheets
  end

  root to: "admin/answesheets#index"
  devise_for :admins
  post 'slack/button'
end
