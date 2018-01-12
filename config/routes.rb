Rails.application.routes.draw do
  root :to => "venues#index"
  # Routes for the Category_id resource:
  # CREATE
  get "/category_ids/new", :controller => "category_ids", :action => "new"
  post "/create_category_id", :controller => "category_ids", :action => "create"

  # READ
  get "/category_ids", :controller => "category_ids", :action => "index"
  get "/category_ids/:id", :controller => "category_ids", :action => "show"

  # UPDATE
  get "/category_ids/:id/edit", :controller => "category_ids", :action => "edit"
  post "/update_category_id/:id", :controller => "category_ids", :action => "update"

  # DELETE
  get "/delete_category_id/:id", :controller => "category_ids", :action => "destroy"
  #------------------------------

  # Routes for the Dish resource:
  # CREATE
  get "/dishes/new", :controller => "dishes", :action => "new"
  post "/create_dish", :controller => "dishes", :action => "create"

  # READ
  get "/dishes", :controller => "dishes", :action => "index"
  get "/dishes/:id", :controller => "dishes", :action => "show"

  # UPDATE
  get "/dishes/:id/edit", :controller => "dishes", :action => "edit"
  post "/update_dish/:id", :controller => "dishes", :action => "update"

  # DELETE
  get "/delete_dish/:id", :controller => "dishes", :action => "destroy"
  #------------------------------

  # Routes for the Venue resource:
  # CREATE
  get "/venues/new", :controller => "venues", :action => "new"
  post "/create_venue", :controller => "venues", :action => "create"

  # READ
  get "/venues", :controller => "venues", :action => "index"
  get "/venues/:id", :controller => "venues", :action => "show"

  # UPDATE
  get "/venues/:id/edit", :controller => "venues", :action => "edit"
  post "/update_venue/:id", :controller => "venues", :action => "update"

  # DELETE
  get "/delete_venue/:id", :controller => "venues", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
