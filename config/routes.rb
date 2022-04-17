# frozen_string_literal: true

Rails.application.routes.draw do
  
  devise_for :employees
  
  resources :welcome

    root to: 'welcome#index'
end
