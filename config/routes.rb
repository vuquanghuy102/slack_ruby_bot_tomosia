Rails.application.routes.draw do
  namespace :admin do
    resources :questions
  end

  devise_for :admins
  post 'slack/button'
end
