Rails.application.routes.draw do

  resources :advertisement

  resources :posts

  get 'about' => 'welcome#about'

  root 'welcome#index'

  get 'welcome/contact'

end
