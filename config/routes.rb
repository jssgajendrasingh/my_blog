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
  	resources :users, :articles,:comments
  end
end
