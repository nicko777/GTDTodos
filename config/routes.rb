GTDTodos::Application.routes.draw do
  resources :roles

  devise_for :users

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'

  resources :projects
  resources :todos do
    collection do
      put :complete
    end
  end

  root :to => "pages#home"

end

