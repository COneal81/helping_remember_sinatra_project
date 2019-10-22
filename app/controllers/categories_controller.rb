class CategoriesController < ApplicationController

 
  get "/categories" do
    #make sure that the user is logged in
    #get all of the categories and sort by name
    #if not logged in, redirect to home page
      if logged_in?
        @category = Category.all.sort_by{|category| category.name}
        erb :"/categories/index.html"
      else  
        redirect to '/'
      end
  end

 

#CREATE (new erb)
        #This route will send the user to create a new category.
        get "/categories/new" do
          if logged_in?
            erb :"/categories/new.html"
          else 
            flash[:error] = "Login or Signup to create a new category."
            redirect to '/'
          end
        end
      
              #This receives the params from the user filling out the form and create a new instance.
         post "/categories" do
          #  binding.pry
            @category = Category.new(name: params[:name])
            if @category.save
              flash[:message] = "Category Saved.  Now it is time to create a memory!"
              redirect to "/memories/new"
            else 
              flash[:error] = "The box must be filled in to save a new category."
              redirect to '/categories/new.html'
            end
        end
      

  
        get "/categories/:id" do 
          @category = Category.find(params[:id])
          # @user = User.find(params[:id])
          # binding.pry`
          erb :"categories/show.html"
        end
  
        #DELETE
        delete "/categories/:id/delete" do 
          #confirm that the user is logged in and authoriezed to delete the category
          #find the category
          #destroy the category
          @category = Category.find(params[:id])
          @category.destroy
          flash[:message] = "Category Deleted"
     #put flash message here to let the user know that their memory has been destroyed
    redirect "/login"

        end
  
end

