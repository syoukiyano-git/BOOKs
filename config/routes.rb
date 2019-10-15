Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
    root :to => "devise/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end 
  resources :users, only: :show
  resources :rankings, only: :index
  resources :products, only: [:show,:index] do 
      resources :reviews, only: [:new , :create,:destroy,:edit,:update]
      collection do 
          get 'search'
      end 
  end 
  
  
end
 