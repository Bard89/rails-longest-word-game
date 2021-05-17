Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'new', to: 'games#new' # it refers to games-controller, but we use just games, controler is implicit
  post 'score', to: 'games#score'
end
