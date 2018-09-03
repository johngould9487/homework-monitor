Rails.application.routes.draw do
  # get 'children/index'
  # get 'children/show'
  # get 'teaching_groups/index' #this seems to be the landing page
  # get 'teaching_groups/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # routes for teachers
  resources :teaching_groups, only: %i[index show] do
    get '/upcoming_homeworks', to: "assignments#upcoming", as: :upcoming
    get '/past_homeworks', to: "assignments#past", as: :past
    get '/markbook', to: "assignments#markbook", as: :markbook
    resources :assignments, only: [:new, :create, :show, :edit, :update]
  end

  resources :children, only: [:show] do
    get '/upcoming_homeworks', to: "assignments#upcoming", as: :upcoming
    get '/past_homeworks', to: "assignments#past", as: :past
  end

    # resources :assignments, except: [:show, :index ] do
    #   member do
    #     get 'attempts/:attempts_id', to: 'attempts#teacher_show'
    #     get 'attempts/:attempts_id/edit', to: 'attempts#teacher_edit'
    #     patch 'attempts/:attempts_id', to: 'attempts#teacher_update'
    #     put 'attempts/:attempts_id', to: 'attempts#teacher_update'
    #     get 'attempts', to: 'attempts#teacher_index'
    #   end
    #   # resources :attempts, only: %i[index show edit update]
    # end
    # member do
    #   get 'assignments/:assignment_id', to: "assignments#teacher_show"
    #   get 'assignments', to: "assignments#teacher_index"
    # end

  # # routes for guardians
  # resources :children, only: %i[index] do
  #   member do
  #     get 'assignments', to: 'assignments#parent_index'
  #   end
  # end

  # # routes for students
  # resources :assignments, only: %i[index show] do
  #   resources :attempts, only: %i[index show edit update]
  # end

end
