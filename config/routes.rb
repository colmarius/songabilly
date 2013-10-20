SpazzaRubini::Application.routes.draw do

  post 'game' => 'static#game'

  get "game/index"
  get 'end' => "static#end"

  resources :static

  namespace :api do
    resources :game, only: [:index, :create] do
      member do
        post 'quiz/:quiz_id/answer', to: :answer
        post :check
      end
    end
    resources :track, only: [] do
      member do
        post :answer
      end
    end
    resources :genres, only: [:index] do
    end
  end

  root 'static#index'

  # root "game#index"
end
