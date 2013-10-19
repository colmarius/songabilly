SpazzaRubini::Application.routes.draw do
  get "game/index"

  root "game#index"
end
