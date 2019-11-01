class ZookeeperController < ApplicationController
    #routes that handle user account are here

    get '/logout' do
        #clears session hash
        session.clear
        erb :'/keepers/logout'
    end

    get '/account/new' do
        #create new user
        erb :'/keepers/new'
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
        binding.pry
        if session[:id] == params[:id].to_i #needs helper method
            @user = Zookeeper.find_by_id(params[:id])
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

end