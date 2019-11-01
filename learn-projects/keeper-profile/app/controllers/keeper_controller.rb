class ZookeeperController < ApplicationController
    #routes that handle user account are here

    get '/account/new' do
        #create new user
        erb :'/keepers/new'
    end

    patch '/account/:id' do
        #edit account info with params sent from form
        set_user(session)
        @user.update(params[:user])
        redirect to "/account/#{@user.id}"
    end

    get '/account/:id' do
        #display user account/profile page
        #check user has logged in
        if session.include?(:id)
            set_user(session)
            erb :'/keepers/show'
        else
            redirect to "/"
        end
    end

    get '/account/:id/edit' do
        #display edit form for user
        set_user(session)
        erb :'/keepers/edit'
    end

end