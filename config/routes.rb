Rails.application.routes.draw do
  
  root 'website#index'

  # Internal Pages
  get 'index', to: 'website#index'
  get 'contact', to: 'website#contact'
  get 'magic', to: 'website#magic'
  get 'projects', to: 'website#projects'

  # Internal Redirects
  get 'blog', to: 'website#blog'
  get 'resume', to: 'website#resume'
  get 'torahtech', to: 'website#torah_tech'

  # External Redirects
  get 'zoom', to: redirect('https://pivotal.zoom.us/j/3845830623')
  get 'codeland', to: redirect('https://github.com/achasveachas/codeland')
  get 'firstyear', to: redirect('https://leanpub.com/firstyearincode')

  # Admin Pages
  get 'login', to: 'admin#login'
  get 'logout', to: 'admin#logout'
  post 'login', to: 'admin#new_session'
  namespace :admin do
    root "visits#index"
    resources :visits, only: [:index, :show]
    resources :projects, only: [:create, :new, :edit, :update, :destroy]
  end
end
