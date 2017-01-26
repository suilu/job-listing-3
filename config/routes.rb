Rails.application.routes.draw do
  devise_for :users

    root 'welcome#index'

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
        resources :resumes
    end
  end


namespace :admin do
  resources :jobs
end
resources :jobs do
  resources :resumes
end



end
