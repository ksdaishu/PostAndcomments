Rails.application.routes.draw do
  resources :posts
  devise_for :users, path: '',path_names:{sign_in:'login', sign_out:'logout', sign_up:'register'} 

   

    devise_scope :user do
  		root to: 'posts#index'
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
