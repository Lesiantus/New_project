Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'sessions' }

  root 'tests#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :feedbacks, only: %i[new create]

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :results, only: %i[show update] do
    member do
      get :result
      resources :gists, only: :create
    end
  end
  resources :badges, only: :index do
    get :index, on: :collection
  end
  resources :user_badges, only: :index do
    get :index, on: :collection
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists
    resources :badges
  end
end
