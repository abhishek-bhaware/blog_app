Rails.application.routes.draw do
  get 'demo/index'
  get 'welcome/index'
  get 'demo/hello'
  get 'demo/hello1'
  get 'demo/youtube'

  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  # get ':controlller(/:action(/:id))'
end
