class ZookeeperController < ApplicationController

    post '/login' do
        #find user in database, match by email and password
        @user = Zookeeper.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect to "/account/#{@user.id}"
        end
    end

    get '/logout' do
        #clears session hash
        session.clear
        erb :'/keepers/logout'
    end

    get '/account/new' do
        #create new user
        erb :'/keepers/new'
    end

    post '/account' do
        #send form info to zookeeper model to create new user
        #check that user doesn't already exist by matching email
        #show user page once account is created
        if !Zookeeper.find_by(email: params[:user][:email])
            @user = Zookeeper.create(params[:user]) 
            session[:id] = @user.id
        else
            #raise error here and redirect to page with links to login or create page (have both options on one page?)
        end
        redirect to "/account/#{@user.id}"
    end

    patch '/account/:id' do
        #edit account info with params sent from form
        @user = Zookeeper.find_by_id(params[:id])
        @user.update(params[:user])
        redirect to "/account/#{@user.id}"
    end

    get '/account/:id' do
        #display user account/profile page
        #check user has logged in
        if session[:id]  #needs helper method?
            @user = Zookeeper.find_by_id(params[:id])
            @user.id = session[:id]
            binding.pry
            erb :'/keepers/show'
        else
            #add view with error message and links to either login or create account
            redirect to :'/account/new'
        end
    end

    get '/account/:id/edit' do
        #display edit form for user
        @user = Zookeeper.find_by_id(params[:id])
        erb :'/keepers/edit'
    end

    get '/account/:id/logout' do
        session.clear
        erb :'/keepers/logout'
    end

    get '/account/:id/delete' do
        Zookeeper.find_by_id(params[:id]).destroy
        redirect to '/keepers/goodbye'
    end

end