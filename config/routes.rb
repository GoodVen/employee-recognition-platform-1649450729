# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :kudos
  resources :employees
  
  devise_for :employees, path: 'employee', controllers: { sessions: "employees/sessions", registrations: "employees/registrations" }
  devise_for :admins, path: 'admin', controllers: { sessions: "admins/sessions" }

  
  get 'admin' => 'admins/pages#dashboard'
  get 'employee' => 'home#index'
  get 'kudos' => 'kudos#index'
  get 'employees'=> 'employees#index'

  
end
