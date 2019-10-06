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

  get "/categories/" do 
  
    erb :"categories/show"
  end

  
  

  
end
