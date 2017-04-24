Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users
  resources :projects

  root :to => "static_pages#home"
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'users/:id/send_order_mail' => "users#send_order_mail", as: "send_order_mail"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
