GTDTodos::Application.routes.draw do
  devise_for :users

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'

  resources :projects
  resources :todos

  root :to => "pages#home"

end

