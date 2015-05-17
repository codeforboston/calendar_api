Rails.application.routes.draw do

  root 'public#index'

  devise_for :users

  authenticate :user do
    ActiveAdmin.routes(self)
  end

scope '/api' do
  scope '/v1' do
    resources :events, only: [:index, :show], defaults: { format: :json } do
      collection do
        get :search, action: :search
      end
    end
    resources :sources, only: [:index, :show], defaults: { format: :json }
  end
end

end
