Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/new' => 'users/registrations#new', :as => 'new_user_registration'
    get 'users/edit' => 'users/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'users/registrations#update', :as => 'user_registration'
    get 'users/cancel' => 'users/registrations#cancel', :as => 'cancel_user_registration'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/test', to: 'application#test'
  root to: 'home#index'
end
