class UsersController < ApplicationController

  # GET: /users
  get "/signup" do
    redirect to '/memories' if logged_in?
    erb :"/users/signup.html"
    end
  end

  post '/signup' do 
  


    get "/login" do
      redirect to '/memories' if logged_in?
      erb :"users/login.html"
     
      
    end

    

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end

