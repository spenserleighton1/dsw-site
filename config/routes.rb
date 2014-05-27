Denverstartupweek::Application.routes.draw do

  resources :submissions, except: [ :edit, :update, :destroy ], path: 'panel-picker', path_names: { new: 'submit' } do
    collection do
      get :thanks
      get :by_day
      get :closed
    end
    resources :votes, only: :create
    resources :comments, only: :create
  end

  resources :newsletter_signups, only: :create
  resources :volunteer_signups, only: :create
  resources :sponsor_signups, only: :create

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  ActiveAdmin.routes(self)

  mount Cmsimple::Engine => '/'

end
