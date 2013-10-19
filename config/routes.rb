SpazzaRubini::Application.routes.draw do

  get "game/index"

  resources :static

  namespace :api do
    resources :game, only: [:index] do
    end
  end

  root "game#index"
end
