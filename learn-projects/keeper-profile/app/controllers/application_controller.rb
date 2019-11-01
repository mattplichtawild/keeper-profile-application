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

  def set_user(session)
    @user = Zookeeper.find(session[:id])
  end

  def set_animal(params)
    @animal = Animal.find(params[:animal_id])
  end

  def set_keeper_and_animal(params) 
    #method might not be used
    @user = Zookeeper.find(params[:id])
    @animal = Animal.find(params[:animal_id])
  end

  def logged_in?(session)
    !!session[:id]
  end

end
