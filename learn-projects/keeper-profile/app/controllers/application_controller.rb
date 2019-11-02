require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret" #change this secret before deploying
  end

  get "/" do
    erb :welcome
  end

  get "/account" do
    if logged_in?(session)
      redirect to "/account/#{session[:id]}"
    else
      redirect to "/account/new"
    end
  end

  def set_user(session)
    if logged_in?(session)
      @user = Zookeeper.find(session[:id])
    end
  end

  def set_animal(params)
    @animal = Animal.find_by_id(params[:animal_id])
  end

  def set_user_and_animal(params) 
    set_user(session)
    set_animal(params)
  end

  def logged_in?(session)
    !!session[:id]
  end

end
