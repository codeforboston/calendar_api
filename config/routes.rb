Rails.application.routes.draw do

  root 'public#index'

  devise_for :users

  authenticate :user do
    resources :sources
    resources :events
  end

scope '/api' do
  scope '/v1' do
    resources :events, only: [:index, :show], defaults: { format: :json }
    resources :sources, only: [:index, :show], defaults: { format: :json }
  end
end

end
