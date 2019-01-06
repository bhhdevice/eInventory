Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :employees, only: [:index, :show]
  namespace :admin do
    resources :users, controller: 'users' do
      collection do
        post :import
      end
    end
    resources :equipment do
      collection do
        post :import
      end
    end
    resources :brands do
      collection do
        post :import
      end
    end
    resources :models do
      collection do
        post :import
      end
    end
    resources :categories do
      collection do
        post :import
      end
    end
    resources :job_titles do
      collection do
        post :import
      end
    end
    resources :departments
    resources :locations do
      collection do
        post :import
      end
    end
    resources :assignments do
      collection do
        post :import
      end
    end
    resources :stocks, except: [:new, :edit, :destroy]
    resources :logs, only: [:index, :show, :destroy] do
      collection do
        post :import
      end
    end


    root to: "equipment#index"
  end

  get 'equipment/models', controller: 'equipment'
  get 'equipment/category', controller: 'equipment'
  get 'assignments/quick_add', action: 'quick_add', controller: 'admin/assignments'
  post 'assignments/quick_create', action: 'quick_create', controller: 'admin/assignments'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
