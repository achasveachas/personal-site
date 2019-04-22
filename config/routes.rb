Rails.application.routes.draw do
  
  root 'website#index'

  get 'index', to: 'website#index'

  get 'contact', to: 'website#contact'

  get 'projects', to: 'website#projects'

  get 'blog', to: 'website#blog'

  get 'resume', to: 'website#resume'

  get 'magic', to: 'website#magic'

  get 'zoom', to: 'https://pivotal.zoom.us/j/3845830623'

  get 'login', to: 'admin#login'
  get 'logout', to: 'admin#logout'
  post 'login', to: 'admin#new_session'

  

  namespace :admin do
    root "visits#index"
    resources :visits, only: [:index, :show]
    resources :projects, only: [:create, :new, :edit, :update, :destroy]
  end
end
