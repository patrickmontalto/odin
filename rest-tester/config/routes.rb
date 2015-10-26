Rails.application.routes.draw do
  resources :users
  # GET    /users(.:format)          users#index
  # GET    /users/:id(.:format)      users#show
  # GET    /users/new(.:format)      users#new
  # GET    /users/:id/edit(.:format) users#edit
  # PATCH  /users/:id(.:format)      users#update
  # PUT    /users/:id(.:format)      users#update
  # POST   /users(.:format)          users#create
  # DELETE /users/:id(.:format)      users#destroy

end
