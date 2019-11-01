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

  def current_user(session)
    @user = User.find(session[:id])
  end

  def logged_in?(session)
      !!session[:id]
  end

end
