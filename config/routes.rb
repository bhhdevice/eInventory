Rails.application.routes.draw do
  resources :employees, only: [:index, :show]
  resources :job_titles, except: [:show]
  resources :departments, except: [:show]
  resources :locations, except: [:show]
  scope :admin do
    resources :users, controller: :users
  end
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
