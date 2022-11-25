Rails.application.routes.draw do
  
  namespace :api do
    
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :tests do 
      resources :questions do
        resources :results
      end
    end
  
  end

end
