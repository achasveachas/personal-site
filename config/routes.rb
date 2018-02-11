Rails.application.routes.draw do

  get 'index', to: 'website#index'

  get 'contact', to: 'website#contact'

  get 'projects', to: 'website#projects'

  get 'blog', to: 'website#blog'

  get 'resume', to: 'website#resume'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'website#index'

  get 'admin', to: 'admin#admin'
  get 'login', to: 'admin#login'
  post 'login', to: 'admin#session'

  

  namespace :admin do
    
    resources :projects, only: [:create, :new, :edit, :update, :delete]
  end
end
