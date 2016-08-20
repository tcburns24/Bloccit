Rails.application.routes.draw do

  get 'sponsored_posts/show'

  get 'sponsored_posts/new'

  get 'sponsored_posts/edit'

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :topics do
    resources :sponsored_posts
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
