Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :employees, only: [:index, :show]
  namespace :admin do
    resources :users, controller: 'users'
    resources :equipment
    resources :brands
    resources :models
    resources :categories
    resources :job_titles
    resources :departments
    resources :locations
    resources :assignments
    resources :stocks, except: [:new, :edit, :destroy]


    root to: "equipment#index"
  end

  get 'equipment/models', controller: 'equipment'
  get 'equipment/category', controller: 'equipment'
  get 'assignments/quick_add', action: 'quick_add', controller: 'admin/assignments'
  post 'assignments/quick_create', action: 'quick_create', controller: 'admin/assignments'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
