require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "za7dw4n2dlr3sockw5fkedj3mLgoemw04825jo6ii654jd9fjw0"
  end

  get "/" do
    erb :'users/index.html'
  end

end
