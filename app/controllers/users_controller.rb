class UsersController < ApplicationController
  
  get '/login' do
    # if logged_in?
    #    redirect to "/users/#{current_user.id}"
    # else  
      erb :"users/login.html"
    # end
  end

  post '/login' do 
    # this receives the params from the name tag that the user entered in the from, from the Views
    #Reminder: by running params.to_s in the post controller, Open shotgun, fill in 
    # login form, press submit and see the key/value data that is returned
    # params.to_s
    # {"email"=>"oma@oma.com", "password"=>"oma"}    
  #   #this finds the user based on the email attribute that ths user entered 
       @user = User.find_by(email: params[:email])
      #  binding.pry - once in pry, type params to see what the params are.  Also type @user and you 
      #should see all of the users info.
  # #   #next we need to authenticate the user.  This checks their password against the password in the database.
        if @user.authenticate(params[:password])
  # #     #then we would start a session, which is what actually logs the user into the app.
          session[:user_id] = @user.id
  # #     #if successful, flash a message that welcomes the user
           flash[:message] = "Welcome #{@user.username} to Helping Remember"
  # #     #redirect to their account/ users/show
          redirect "/users/#{@user.id}"
     else
  # #     #flash message saying that was an incorrect email or password
         flash[:error] = "Incorrect Email or Password.  Please try again."
  # #     #redirect to login page 
          redirect to '/login'
      
     end
  end
   
  #this renders the show page (show route)
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    @memory = Memory.all
    erb :'/memories/show.html' 
  end


     # renders the signup from in views
  get '/signup' do 
    erb :'/users/signup.html'
  end
 
  post '/signup' do 
    
    
   #create a new user
   @user = User.create(params)
  #  binding.pry
   #start a new session
   session[:user_id] = @user.id
   #redirect the user to their show page
   redirect "/users/#{@user.id}"
  end

  get '/logout' do 
    if logged_in?
    session.clear 
    redirect to '/login'
    else
    redirect to '/'
    end
  end
end

