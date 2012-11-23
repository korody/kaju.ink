KajuInk::Application.routes.draw do
  match '/work', to: 'pages#work',  as: 'work'
  match '/about',   to: 'pages#about', as: 'about'

  root to: 'pages#home'
end
