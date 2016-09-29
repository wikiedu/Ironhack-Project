Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'welcome#index'
  
  resources :clients do
    resources :locations do
      collection { post :import }
    end
    resources :expeditions do
      collection { post :import }
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
