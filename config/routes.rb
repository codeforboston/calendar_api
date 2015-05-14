Rails.application.routes.draw do

  root 'public#index'

  devise_for :users

  authenticate :user do
    resources :sources
    resources :events
  end


end
