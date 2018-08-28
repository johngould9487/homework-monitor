Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # routes for teachers
  resources :teaching_groups, only: %i[index show] do
    resources :assignments, except: :show do
      resources :attempts, only: %i[index show edit update]
    end
    member do
      get 'assignments/:assignment_id', to: "assignments#teacher_show"
    end
  end

  # routes for guardians
  resources :children, only: %i[index show] do
    member do
      get 'assignments', to: 'assignments#parent_index'
      get 'assignments/:assignment_id', to: 'assignments#parent_show'
    end
  end

  # routes for students
  resources :assignments, only: %i[index show] do
    resources :attempts, only: %i[index show edit update]
  end
end
