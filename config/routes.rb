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
  	resources :users , except: [:destroy] do 
      get "change_password", on: :member
      patch "update_password", on: :member
    end 
    resources :articles , only: [:index,:edit,:update,:show]
    resources :comments , only: [:index]
    resources :sessions, only: [:create] 
  
  end
  root 'admin/sessions#index'
  get '/login', to: 'admin/sessions#new', as: :admin_login
  delete '/logout', to: 'admin/sessions#destroy', as: :admin_logout
  get 'user/:id/role', to: "admin/users#make_super", as: :make_superadmin
end
