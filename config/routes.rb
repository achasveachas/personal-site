Rails.application.routes.draw do
  get 'index', to: 'website#index'

  get 'contact', to: 'website#contact'

  get 'projects', to: 'website#projects'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'website#index'
end
