require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "za7dw4n2dlr3sockw5fkedj3mLgoemw04825jo6ii654jd9fjw0"
    
    
  end

  get '/' do
    
    erb :'/index.html'
  end


  helpers do 

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(session[:user_id])
    end

    
  end

end
