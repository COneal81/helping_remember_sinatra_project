class MemoriesController < ApplicationController

#READ (index erb)
  get "/memories" do
    if logged_in? 
      #NOTE: This is going to display all of the memories from all of the users.
      @memory = Memory.all     
      @category = Category.all
    erb :"/memories/index.html"
    else  
      redirect to '/'
    end
  end


#CREATE (new erb)
        #This route will send the user to a form to fill out to create a new memory.
  get "/memories/new" do
    if logged_in?
      @category = Category.all
      erb :"/memories/new.html"
    else 
      flash[:error] = "Login or Signup to create a new memory."
      redirect to '/'
    end
  end

        #This receives the params from the user filling out the form and create a new instance.
   post "/memories" do
    #  binding.pry
      @memory = Memory.new(title: params[:title], description: params[:description], date: params[:date], image_url: params[:image_url], category_id: params[:category_id], user_id: current_user.id)
      if @memory.save
      flash[:message] = "Memory Saved"
      redirect to "/memories/#{@memory.id}"
      else 
        flash[:error] = "Title, Description, Date, and Category must be filled in to save a new memory."
        redirect to '/memories/new'
      end
    end

  #READ continued (show erb)
  get "/memories/:id" do
    @memory = Memory.find(params[:id])
    #renders the memory
    erb :"/memories/show.html"
  end

  # UPDATE
  get "/memories/:id/edit" do
    #find the memory
    #confirm the user is logged in and is authorized to edit the memory
    @category = Category.all
    @memory = Memory.find(params[:id])
    if authorized_to_edit_delete(@memory)
        #render the edit view
        erb :"/memories/edit.html"
      else 
        redirect to '/memories'
    end
  end

  # UPDATE - PATCH
  patch "/memories/:id" do 
    #find the memory
    #call the update method on the memory.
    # binding.pry
      @memory = Memory.find(params[:id])
      @memory.update(title: params[:title], description: params[:description], date: params[:date], image_url: params[:image_url], category_id: params[:category_id])
    flash[:message] = "Update Complete"
    redirect "/memories/#{@memory.id}"
  end

  # DELETE
  delete "/memories/:id/delete" do
    
    #confirm that the user is logged in and authoried to delete the memory
    #find the memory
    #destroy the memory
    @memory = Memory.find(params[:id])
    if authorized_to_edit_delete(@memory)  
      @memory.destroy
      flash[:message] = "Memory Deleted"
       #put flash message here to let the user know that their memory has been destroyed
      redirect "/login"
    # else  
    #   #redirect the user to the home page 
    #   redirect to '/'
    end
  end
end
