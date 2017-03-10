Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :welcome, only: [:index]
  resources :users
  resources :sessions
  resources :books
  resources :receptions, only: [] do
    collection do
      get :new_take_book
      get :new_return_book
      post :take_book
      post :return_book
    end

  end

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  
  root 'welcome#index'
end
