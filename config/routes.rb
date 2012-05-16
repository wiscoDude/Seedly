Seedly::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :skip => [:registrations, :sessions] do
    # devise/registrations
    get 'signup'         => 'devise/registrations#new',     :as => :new_user_registration
    get 'register'         => 'devise/registrations#new',     :as => :new_user_registration
    post 'signup'         => 'devise/registrations#create', :as => :user_registration
    get 'users/cancel'    => 'devise/registrations#cancel', :as => :cancel_user_registration
    get 'users/edit'      => 'devise/registrations#edit',   :as => :edit_user_registration
    put 'users'           => 'devise/registrations#update'
    delete 'users/cancel' => 'devise/registrations#destroy'

    # devise/sessions
    get 'signin'  => 'devise/sessions#new',     :as => :new_user_session
    post 'signin' => 'devise/sessions#create',  :as => :user_session
    get 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  match 'dashboard' => 'users#dashboard', :as => 'user_root'
  
  match '/zip(/:postal_code)', :to => 'postal_codes#show', :as => "show_zip"
  match 'lookup_zip', :to => 'postal_codes#lookup_zip'
  match '/users/simple_signup', :to => 'users#simple_signup'
  
  root :to => 'content#index'
  match "/choose_kit" => "content#choose_kit", :as => "choose_kit"
  match "/about" => "content#about", :as => "about"
  match "/how_this_works" => "content#how_this_works", :as => "how_works"
end
