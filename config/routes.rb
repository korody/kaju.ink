KajuInk::Application.routes.draw do
  
  get "jobs/index"

  get "jobs/show"

  get "jobs/new"

  get "jobs/edit"

  get "jobs/admin"

  match '/hello', to: 'contact#new',     as: 'new',  via: :get
  match '/hello', to: 'contact#create',  as: 'create',  via: :post

  match '/kaju',   to: 'pages#about', as: 'about'

  root to: 'pages#home'
end
