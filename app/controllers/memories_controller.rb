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
  end

        #This receives the params from the user filling out the form and create a new instance.
   post "/memories" do
      @memory = Memory.create(title: params[:title], description: params[:description], date: params[:date], image_url: params[:image_url], category_id: params[:category_id], user_id: current_user.id)
      
      redirect to "/memories/#{@memory.id}"
  end

  #Read (show erb)
  get "/memories/:id" do
    @memory = Memory.find(params[:id])
    #renders the memory
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
    if logged_in?
    end
    redirect "/memories"
  end
end
