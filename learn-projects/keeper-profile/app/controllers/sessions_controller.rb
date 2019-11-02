class SessionsController < ApplicationController
    #routes that alter session id are in this controller
    
    post '/login' do
        #find user in database, match by email and password
        @user = Zookeeper.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect to "/account/#{@user.id}"
        end
    end

    post '/account' do
        #send form info to zookeeper model to create new user
        #check that user doesn't already exist by matching email
        #show user page once account is created
        if Zookeeper.find_by(email: params[:email])
            redirect to "/"
        else
            @user = Zookeeper.create(params[:user]) 
            session[:id] = @user.id
        end
        redirect to "/account/#{@user.id}"
    end

    get '/account/:id/delete' do
        Zookeeper.find_by_id(params[:id]).destroy
        session.clear
        redirect to '/keepers/goodbye'
    end

    get '/logout' do
        #clears session hash
        session.clear
        redirect to '/'
    end

end