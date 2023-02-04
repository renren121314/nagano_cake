Rails.application.routes.draw do
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end

  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
