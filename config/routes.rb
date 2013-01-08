KajuInk::Application.routes.draw do
  
  match '/hello', to: 'contact#new',     as: 'new',  via: :get
  match '/hello', to: 'contact#create',  as: 'create',  via: :post

  match '/work', to: 'pages#work',  as: 'work'
  match '/kaju',   to: 'pages#about', as: 'about'

  root to: 'pages#home'
end
