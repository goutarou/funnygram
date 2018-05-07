Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'

  resources :post_images, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


  resources :users, only: [:show, :edit, :update] do
    member do
      get'favorites'
    end
  end

end
