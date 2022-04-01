# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  root 'home#index'

  # Courses Routes
  get '/courses', to: 'course#index', as: :courses
  get '/courses/new', to: 'course#new', as: :new_course
  post '/courses', to: 'course#create', as: :create_course
  get '/courses/:id', to: 'course#show', as: :course
  get '/courses/:id/edit', to: 'course#edit', as: :edit_course
  put '/courses/:id', to: 'course#update', as: :update_course
  patch '/courses/:id', to: 'course#update', as: :patch_course
  delete '/courses/:id', to: 'course#destory', as: :destroy_course

  # Topics Routes
  get '/courses/:course_id/topics', to: redirect('/courses/%{course_id}#topics'), as: :topics
  get '/courses/:course_id/topics/new', to: 'topic#new', as: :new_topic
  post '/courses/:course_id/topics', to: 'topic#create', as: :create_topic
  get '/courses/:course_id/topics/:id', to: 'topic#show', as: :topic
  get '/courses/:course_id/topics/:id/edit', to: 'topic#edit', as: :edit_topic
  put '/courses/:course_id/topics/:id', to: 'topic#update', as: :update_topic
  patch '/courses/:course_id/topics/:id', to: 'topic#update', as: :patch_topic
  delete '/courses/:course_id/topics/:id', to: 'topic#destory', as: :destroy_topic
end
