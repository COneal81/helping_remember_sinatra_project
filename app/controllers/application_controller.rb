require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #This enables sessions
    enable :sessions
    set :session_secret, "za7dw4n2dlr3sockw5fkedj3mLgoemw04825jo6ii654jd9fjw0"
    register Sinatra::Flash
    
  end

  get '/' do
    erb :'/welcome.html'
  end

#These methods are helpers to determine if a user is logged in.
  helpers do 
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized_to_edit_delete(memory)
      memory.user == current_user
    end


    # def slug 
    #   title.downcase.gsub(" ", "-")
    # end

    # def self.find_by_slug(slug)
    #   Memory.all.find{|memory| memory.slug == slug}
    # end
  end

end
