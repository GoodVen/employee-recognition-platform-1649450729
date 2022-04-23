# frozen_string_literal: true

Rails.application.routes.draw do
  
  devise_for :employees, path: 'employee', controllers: { sessions: "employees/sessions" }
  devise_for :admins, path: 'admin', controllers: { sessions: "admins/sessions" }

  resources :kudos
  get 'admin' => 'admins/pages#dashboard'


  root to: 'kudos#index'
end
