Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  resources :trainings
  resources :profils do
    member do
      post 'follow'
      delete 'unfollow'
    end
  end
  get 'pages/zone_info/:id', to: 'pages#zone_info', as: 'zone_info_page'
  resources :notifs, only: [:destroy]
  resources :leaderboards, only: [:index] do
    collection do
      get :filter_by_zone
      get :index_filtered
    end
  end
  get 'pages/stats', to: 'pages#stats', as: 'stats_page'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
