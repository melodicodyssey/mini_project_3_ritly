Ritly::Application.routes.draw do

  root to: 'ritly#index'

  get '/ritly', to: 'ritly#index'

  get '/ritly/:search', to: 'ritly#show'

  post 'ritly/show', to: 'ritly#show'


end