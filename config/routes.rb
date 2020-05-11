Rails.application.routes.draw do

  get 'user' => 'users#show'
  resources :posts
  devise_for :users, path: '',path_names:{sign_in:'login', sign_out:'logout', sign_up:'register'} 

  	resources :users, only: [:show] do
    	resources :posts, only: [:index, :new, :create]
    end
   root 'initial_pages#home'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
