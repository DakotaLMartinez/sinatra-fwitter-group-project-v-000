require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "supreme_leader!!!"
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    # session = {}
    # session[:id] = 1
    if !!session[:id]
      redirect "/tweets"
    else
      erb :"users/create_user"
    end
  end

  post "/signup" do
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      redirect "/tweets"
    else 
      redirect "/signup"
    end
  end
  
  get "/tweets" do 
    erb :"tweets/tweets"
  end
  
  helpers do 
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end

end
