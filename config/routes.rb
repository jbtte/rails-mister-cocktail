Rails.application.routes.draw do
  get 'doses/new'
  # get 'cocktails/index'
  # get 'cocktails/show'
  # get 'cocktails/new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, except: [ :update, :destroy, :edit ] do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [ :destroy ]
end
