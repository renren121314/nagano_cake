Rails.application.routes.draw do

   root to: "public/homes#top"
  namespace :public do
    get 'homes/about'
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    resources :items, only: [:index,:show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :customers, only: [:edit, :unsubscribe, :update, :withdraw]
  end
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
