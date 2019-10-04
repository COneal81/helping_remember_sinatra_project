class MemoriesController < ApplicationController

#READ (index erb)
  get "/memories" do
    if logged_in?
    @memory = Memory.all
    erb :"/memories/index.html"
    
  else 
    redirect to '/login'
  end
  end


#CREATE (new erb)
        #This route will send the user to a form to fill out to create a new memory.
  get "/memories/new" do
    if logged_in?
    erb :"/memories/new.html"
  end

        #This receives the params from the user filling out the form and create a new instance.
   post "/memories" do
      @memories = Memory.create(title: params[:title], description: params[:description], date: params[:date], image_url: params[:image_url], user_id: current_user.id)
      
     
  end

  #Read (show erb)
  get "/memories/:id" do
    @memories = Memory.find(params[:id])
    erb :"/memories/show.html"
  end

  # GET: /memories/5/edit
  get "/memories/:id/edit" do
    erb :"/memories/edit.html"
  end

  # PATCH: /memories/5
  patch "/memories/:id" do
    redirect "/memories/:id"
  end

  # DELETE: /memories/5/delete
  delete "/memories/:id/delete" do
    redirect "/memories"
  end
end
