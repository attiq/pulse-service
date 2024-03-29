# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout'
                               },
                     controllers: {
                       sessions: 'users/sessions'
                     }
  resources :opportunities
  resources :members

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
