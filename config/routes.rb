Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root to: 'home#index'

   resources :categories, only: %i[new create index] do 
    resources :transactions, only: %i[index create new] 
  end

  resources :users, only: %i[index]
  # root "home#index"
end
