Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :admin do
  # 	resources :users do
  # 		resources :articles do 
  # 			resources :comments
  # 		end	
  # 	end	
  # end

  namespace :admin do
  	resources :users , only: [:index,:edit,:update]
    resources :articles , only: [:index,:edit,:update]
    resources :comments , only: [:index,:edit,:update]
    resources :sessions, only: [:new, :create, :destroy]
  end

  #get '/login', to: 'admin/sessions#new', as: :admin_login
  #delete '/logout', to: 'admin/sessions#destroy', as: :admin_logout
end
