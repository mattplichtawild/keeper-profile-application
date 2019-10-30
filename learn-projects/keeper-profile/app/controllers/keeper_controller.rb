class ZookeeperController < ApplicationController

    get '/login' do
        #sets user id as session user_id
        erb :'/keepers/login'
    end

    get '/logout' do
        #clears session hash
        erb :'/keepers/logout'
    end

    get '/account/new' do
        #create new user
        erb :'/keepers/new'
    end

    post '/account/new' do
        #send form info to zookeeper model to create new user
        redirect to "/account/#{user.id}"
    end

    get '/account/:id' do
        #display user account/profile page
    end

    get '/account/:id/animals' do
        #display index of animals owned by user
    end

    get '/account/:id/animals/new' do
        #display form to create new animal
    end

    post '/account/:id/animals/new' do
        #sends info from form to animal model to create new animal
    end

    get '/account/:id/animals/:animal_id' do
        #display specific animal profile page
    end

    get '/account/:id/animals/:animal_id/edit' do
        #edit the specific animal
    end

    get '/account/:id/edit' do
        #display edit form for user
    end



end