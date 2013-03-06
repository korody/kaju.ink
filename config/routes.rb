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
    get 'admin', on: :collection
  end

  resources :humans, path: 'humans', controller: :jobs
  resources :abstracts, path: 'abstracts', controller: :jobs
  resources :serials, path: 'serials', controller: :jobs
  resources :characters, path: 'characters', controller: :jobs
  resources :walls, path: 'walls', controller: :jobs
  resources :expos, path: 'expos', controller: :jobs
  resources :patterns, path: 'patterns', controller: :jobs
  resources :brandings, path: 'brandings', controller: :jobs
  resources :institutionals, path: 'institutionals', controller: :jobs
  resources :cocreations, path: 'cocreations', controller: :jobs
  resources :events, path: 'events', controller: :jobs
  
  resources :products do
    resources :thumbnails
  end

  match '/hello', to: 'contact#new',     as: 'hello',  via: :get
  match '/hello', to: 'contact#create',  as: 'hello',  via: :post

  match '/art',   to: 'pages#art', as: 'art'
  match '/graphic',   to: 'pages#graphic', as: 'graphic'
  match '/random',   to: 'jobs#random', as: 'random'
  match '/kaju',   to: 'pages#about', as: 'about'
  match '/welcome',   to: 'pages#welcome', as: 'home'

  match '/admin',   to: 'jobs#admin', as: 'admin'

  root to: 'pages#home'
end
