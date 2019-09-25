class UsersController < ApplicationController
  
  get '/login' do
    if logged_in?
      redirect to '/memories' 
    else
    erb :"users/login.html"
    end
  end

  post '/login' do 
    # this receives the params that the user entered in the from, from the Views
    #Reminder: by running params.to_s in the post controller, Open shotgun, fill in 
    # login form, press submit and see the key/value data that is returned
    # params.to_s
    
    #this finds the user based on the email attribute that ths user entered 
      user = User.find_by(email: params[:email])
    #next we need to authenticate the user
    if user && user.authenticate(params[:password])
      #then we would start a session
      session[:user_id] = user.id
      #if successful, flash a message that welcomes the user
      flash[:message] = "Welcome #{user.username}"
      #redirect to their account
      redirect to '/users/#{user.id}'
    else 
      #flash message saying that was an incorrect email or password
      flash[:error] = "Incorret Email or Password.  Please try again."
      #redirect to login page 
      redirect to '/login'
    end
  end

 
   

    get '/users/:id'
      user = User.find_by(id: params[:id])
      erb :'/users/show'   
    end
    

      
     # renders the signup from in views
  get "/signup" do
    redirect to '/memories' if logged_in?
    erb :"/users/signup.html"
    end
  end

  post '/signup' do 
    
  end

  

  get '/logout' do 
    session.clear 
    redirect to '/'
  end
end
