Rails.application.routes.draw do
  root 'google_search#index'
  resources :google_search, only: :index do
    get :search, on: :collection
  end
  get '*path', to: redirect('/google_search')
end
