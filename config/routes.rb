Rails.application.routes.draw do
<<<<<<< HEAD
  get 'sessions/new'
=======
>>>>>>> 9c77ad610cfa9013a53d8359f10ff3285219640f
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
end
