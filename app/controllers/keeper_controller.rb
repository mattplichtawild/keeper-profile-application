class ZookeeperController < ApplicationController
    #routes that handle user account are here
    # before_action :check_for_login

    def check_for_login
        # (2020.06.08) Did I just not finish writing this method?

    end
    
    get '/account/new' do
        #create new user
        if !logged_in?(session)
            erb :'/keepers/new'
        else
            redirect to "/account/#{session[:id]}"
        end
    end

    patch '/account/:id' do
        #edit account info with params sent from form
        set_user(session) 
        if params[:id] == session[:id]  
            @user.update(params[:user])
        end
        redirect to "/account/#{@user.id}"
    end

    get '/account/:id' do
        #display user account/profile page
        #check user has logged in
        if logged_in?(session)
            set_user(session)
            erb :'/keepers/show'
        else
            redirect to "/"
        end
    end

    get '/account/:id/edit' do
        #display edit form for user
        if logged_in?(session) 
            set_user(session)
            erb :'/keepers/edit'
        else
            redirect to "/"
        end
    end

end