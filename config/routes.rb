Rails.application.routes.draw do

  root controller: :questions, action: :index
  resources :questions, except: [:index, :show]

  resources :quiz, only: :show do
    member do
      patch :answer
    end
  end
end
