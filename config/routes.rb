Rails.application.routes.draw do
  resources :games,     only: [:index, :show, :create, :update]
  resources :employees, only: [:index, :show, :create, :destroy] do
    get :by_speciality, on: :collection
  end
  resources :trackers,  only: [:index, :show, :create, :destroy]

  root 'home#index'
  get '*path' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
