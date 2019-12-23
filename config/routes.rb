Rails.application.routes.draw do
  resources :challenges
  root to: 'challenges#index'
end
