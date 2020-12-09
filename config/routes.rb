Rails.application.routes.draw do
  resources :samples do
    collection do
      post :confirm
    end
  end
    root 'samples#top'
end
