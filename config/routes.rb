KajuInk::Application.routes.draw do
  
  resources :clients
  resources :people, controller: :clients
  resources :companies, controller: :clients 
  

  resources :jobs do
    resources :attachments
    resources :thumbnails
    resources :products do
      resources :thumbnails
    end
    resources :clients do
      resources :thumbnails
    end
  end

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
  
  resources :products do
    resources :thumbnails
  end

  match '/hello', to: 'contact#new',     as: 'hello',  via: :get
  match '/hello', to: 'contact#create',  as: 'hello',  via: :post

  match '/art',   to: 'pages#art', as: 'art'
  match '/graphic',   to: 'pages#graphic', as: 'graphic'
  match '/kaju',   to: 'pages#about', as: 'about'
  match '/home',   to: 'pages#home', as: 'home'

  root to: 'pages#HOME'
end
