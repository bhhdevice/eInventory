Rails.application.routes.draw do
  devise_for :users
  resources :employees, only: [:index, :show]
  scope :admin do
    resources :users, controller: :users
    resources :job_titles, except: [:show], controller: :job_titles
    resources :departments, except: [:show], controller: :departments
    resources :locations, except: [:show], controller: :locations
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
