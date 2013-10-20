SpazzaRubini::Application.routes.draw do

  post 'game' => 'static#game'

  get "game/index"

  resources :static

  namespace :api do
    resources :game, only: [:index, :create] do
    end
  end

  root 'static#index'
  
  # root "game#index"
end
