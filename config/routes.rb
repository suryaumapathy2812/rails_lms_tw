Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  root "course#index"

  get "/courses", to: "course#index", :as => :courses
  get "/courses/new", to: "course#new", :as => :new_course
  post "/courses", to: "course#create", :as => :create_course
  get "/courses/:id", to: "course#show", :as => :course
  get "/courses/:id/edit", to: "course#edit", :as => :edit_course
  put "/courses/:id", to: "course#update", :as => :update_course
  patch "/courses/:id", to: "course#update", :as => :patch_course
  delete "/courses/:id", to: "course#destory", :as => :destory_course

end
