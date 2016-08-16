Rails.application.routes.draw do
	root to: 'visitors#index'
	devise_for :users
	resources :users do 
		member do
			get 'download_file'
		end
	end
	resources :messages
end
