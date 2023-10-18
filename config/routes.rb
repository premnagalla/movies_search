Rails.application.routes.draw do
  resources :movies, :only => [:index, :show] do
    collection do
      get 'search'
    end
  end

  # Defines the root path route ("/")
  root "movies#index"
end
