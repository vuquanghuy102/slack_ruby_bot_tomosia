Rails.application.routes.draw do
  namespace :admin do
    get 'profile' => 'admins#show'
    resources :questions
  end

  root to: "admin/questions#index"
  devise_for :admins
  post 'slack/button'
end
