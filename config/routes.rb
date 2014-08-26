KajuInk::Application.routes.draw do
  
  resources :clients do
    collection do
      get :autocomplete
    end
  end
  resources :people, path: 'people', controller: :clients
  resources :companies, path: 'companies', controller: :clients 
  
  resources :jobs do
    resources :products
    resources :clients
  end

  resources :thumbnails, only: [:create, :destroy]
  resources :attachments, only: [:create, :destroy]

  resources :humans, path: 'humans', controller: :jobs
  resources :animals, path: 'animals', controller: :jobs
  resources :abstracts, path: 'abstracts', controller: :jobs
  resources :serial, path: 'serial', controller: :jobs
  resources :characters, path: 'characters', controller: :jobs
  resources :walls, path: 'walls', controller: :jobs
  resources :canvas, path: 'canvas', controller: :jobs
  resources :expos, path: 'expos', controller: :jobs
  resources :collage, path: 'collage', controller: :jobs
  resources :patterns, path: 'patterns', controller: :jobs
  resources :brandings, path: 'brandings', controller: :jobs
  resources :institutionals, path: 'institutionals', controller: :jobs
  resources :cocreations, path: 'cocreations', controller: :jobs
  resources :events, path: 'events', controller: :jobs
  
  resources :products
  resources :urban, path: 'urban', controller: :products
  resources :society, path: 'society', controller: :products

  resources :clippings

  resources :editorials, path: 'editorials', controller: :clippings
  resources :blogs, path: 'blogs', controller: :clippings
  resources :interviews, path: 'interviews', controller: :clippings

  get '/hello', to: 'contact#new'
  post '/hello', to: 'contact#create'

  get '/art',   to: 'pages#art'
  get '/graphic',   to: 'pages#graphic'
  get '/random',   to: 'jobs#random'
  get '/welcome',   to: 'pages#welcome'

  get '/admin',   to: 'pages#admin'

  root to: 'pages#home'
end