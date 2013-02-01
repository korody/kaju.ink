KajuInk::Application.routes.draw do
  
  resources :jobs
  resources :humans, path: 'humans', controller: :jobs
  resources :abstracts, path: 'abstracts', controller: :jobs
  resources :serials, path: 'serials', controller: :jobs
  resources :patterns, path: 'patterns', controller: :jobs
  resources :characters, path: 'characters', controller: :jobs
  resources :walls, path: 'walls', controller: :jobs
  resources :brandings, path: 'brandings', controller: :jobs
  resources :cocreations, path: 'cocreations', controller: :jobs
  resources :events, path: 'events', controller: :jobs
  resources :layouts, path: 'layouts', controller: :jobs
  resources :archplans, path: 'archplans', controller: :jobs
  resources :maps, path: 'maps', controller: :jobs

  match '/hello', to: 'contact#new',     as: 'hello',  via: :get
  match '/hello', to: 'contact#create',  as: 'hello',  via: :post

  match '/kaju',   to: 'pages#about', as: 'about'
  match '/art',   to: 'pages#art', as: 'art'
  match '/graphic',   to: 'pages#graphic', as: 'graphic'

  root to: 'pages#home'
end
