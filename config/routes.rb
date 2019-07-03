Rails.application.routes.draw do
  resources :reading_statistics
  resources :thermostats do
    resources :readings
    member do
      get 'stats', to: 'thermostats#stats'
    end
  end
  get 'tarun/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
