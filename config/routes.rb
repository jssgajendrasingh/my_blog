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
    resources :articles , except: [:destroy] do
      get "search_article", on: :collection
    end  
    resources :comments , only: [:index]
    resources :tags , only: [:new,:create]
    resources :sessions, only: [:create] 
    resources :messages, only: [:index,:destroy]
  
  end
  root 'admin/sessions#index'
  get '/login', to: 'admin/sessions#new', as: :admin_login
  delete '/logout', to: 'admin/sessions#destroy', as: :admin_logout
  get 'user/:id/role', to: "admin/users#make_super", as: :make_superadmin
end
