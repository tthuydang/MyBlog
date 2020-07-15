Rails.application.routes.draw do
  # mấy resources này tự sinh ra các action và path tương ứng
  resources :sessions
  resources :users
  resources :subscribers
  resources :articles do
    resources :comments
    collection do
      # go lenh 'rake routes' se co them action seach
      get :search # creates a new path for the searching. method='get'
    end
  end

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
