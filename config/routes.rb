Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :download_csv
    end
  end
  root "home#top"
  resources :attendances do
    member do
      patch :clockin
      patch :clockout
      patch :break_time
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener'
end
