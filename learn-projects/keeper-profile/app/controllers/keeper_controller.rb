class ZookeeperController < ApplicationController

    get '/login' do
        #sets user id as session user_id
    end

    get '/logout' do
        #clears session hash
    end

    get '/user/new' do
        #create new user
    end

    post '/user/new' do
        #send form info to zookeeper model to create new user
    end

    get '/user/:id' do
        #display user account/profile page
    end

    get '/user/:id/animals' do
        #display index of animals owned by user
    end

    get '/user/:id/animals/new' do
        #display form to create new animal
    end

    post '/user/:id/animals/new' do
        #sends info from form to animal model to create new animal
    end

    get '/user/:id/animals/:animal_id' do
        #display specific animal profile page
    end

    get '/user/:id/animals/:animal_id/edit' do
        #edit the specific animal
    end

    get '/user/:id/edit' do
        #display edit form for user
    end



end