Rails.application.routes.draw do

  resources :bloggers, only: [:index, :new, :create, :show]
  resources :posts, only: [:new, :create, :show, :edit, :update]
  resources :destinations, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  patch '/posts/:id/like', to: 'posts#like', as: 'like'

end
