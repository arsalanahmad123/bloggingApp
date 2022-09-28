Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root "pages#index"
  resources :users
  post 'blog/:id/like', to: 'likes#create'
  resources :categories
  resources :blogs do 
  resources :comments
  member do
    put 'like', to: 'blogs#like'
    put 'unlike', to: 'blogs#unlike'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
