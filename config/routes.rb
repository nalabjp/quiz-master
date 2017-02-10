Rails.application.routes.draw do

  root controller: :questions, action: :index
  resources :questions, except: :index do
    member do
      patch :answer
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
