Rails.application.routes.draw do
  resources :contacts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/sign_in', to: 'sessions#sign_in_form'
  post '/sign_in', to: 'sessions#sign_in'
  delete '/sign_out', to: 'sessions#sign_out'

  get '/sign_up', to: 'users#new'

  get    '/articles',     to: 'articles#index'
  get    '/articles/new', to: 'articles#new', as: 'new_article'
  post   '/articles',     to: 'articles#create'
  get    '/articles/:id', to: 'articles#show', as: 'article'
  get    '/articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  patch  '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#delete', as: 'delete_article'


end
