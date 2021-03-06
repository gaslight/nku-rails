NkuRails::Application.routes.draw do
  resources :students, except: :edit do
    resources :attendances
  end
  resources :sessions
  resources :attendances
  resource :seating_chart
  resources :assignments

  namespace :admin do
    resources :assignments
    resource :assignment_upload
  end

  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"

  root to: "seating_charts#show"
end
