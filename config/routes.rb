Rails.application.routes.draw do
  get  'welcome/index'
  resources :articles do
    resources :comments
    collection do
      # go lenh 'rake routes' se co them action seach
      get :search # creates a new path for the searching. method='get'
    end
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
