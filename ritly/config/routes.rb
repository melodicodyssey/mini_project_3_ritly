Ritly::Application.routes.draw do

  root to: 'ritly#index'

  get 'ritly', to: 'ritly#index', as: :index

  post 'ritly/create', to: 'ritly#create'

  get 'ritly/show/:url', to: 'ritly#show', as: :show

  patch 'ritly/update/:url', to: 'ritly#update'

  get 'ritly/go/:url', to: 'ritly#go', as: :go

  delete 'ritly/delete/:id', to: 'ritly#delete', as: :delete

end