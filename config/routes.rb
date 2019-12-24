Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout' }
  get '/home', to: 'pages#home', as: 'home_page'
  get '/about', to: 'pages#about', as: 'about_page'

  resources :challenges do
    resources :solutions
  end

  root to: 'pages#home'
end
