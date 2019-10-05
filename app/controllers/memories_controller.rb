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

  #READ continued (show erb)
  get "/memories/:id" do
    @memory = Memory.find(params[:id])
    #renders the memory
    erb :"/memories/show.html"
  end

  # UPDATE
  get "/memories/:id/edit" do
    #confirm the user is logged in and is authorized to edit the memory
    #find the memory
    @memory = Memory.find(params[:id])
    #render the edit view
    erb :"/memories/edit.html"
  end

  # UPDATE - PATCH
  patch "/memories/:id" do
    
    #find the memory
    #call the update method on the memory.
    @memory = Memory.find(params[:id])
    @memory.update(title: params[:title], description: params[:description], date: params[:date], image_url: params[:image_url], category_id: params[:category_id])

    redirect "/memories/#{@memory.id}"
  end

  # DELETE
  delete "/memories/:id/delete" do
    #confirm that the user is logged in and authoried to delete the memory
    #find the memory
    #destroy the memory
    if logged_in?
      @memory = Memory.find(params [:id])
      @memory.destroy
      #put flash message here to let the user know that their memory has been destroyed
    redirect "/memories"
    else  
      #put a flash error message, only the user can delete this post.
      #redirect the user to the home page 
      redirect to '/'
    end
  end
end
