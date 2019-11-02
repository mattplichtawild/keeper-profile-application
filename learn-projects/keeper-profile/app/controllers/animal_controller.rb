class AnimalController < ApplicationController
    #routes that handle a user's animals are here

    get '/account/:id/animals' do
        #display index of animals owned by user
        set_user(session)
        erb :'/animals/index'
    end

    get '/account/:id/animals/new' do
        #display form to create new animal
        set_user(session)
        erb :'/animals/new'
    end

    get '/account/:id/animals/:animal_id' do
        #display specific animal profile page
        set_user_and_animal(params) 
        erb :'/animals/show'
    end

    patch '/account/:id/animals/:animal_id' do
        #edits and updates the specific animal
        @user = Zookeeper.find_by_id(params[:id])
        @animal = Animal.find_by_id(params[:animal_id])
        @animal.update(params[:animal])
        redirect to "/account/#{@user.id}/animals"
    end

    get '/account/:id/animals/:animal_id/edit' do
        # @user = Zookeeper.find_by_id(params[:id])
        # @animal = Animal.find_by_id(params[:animal_id]) 
        set_user_and_animal(params)
        erb :'/animals/edit'
    end

    post '/account/:id/animals/new' do
        #sends info from form to animal model to create new animal
        @user = Zookeeper.find_by_id(params[:id])
        @animal = Animal.create(params[:animal])
        @user.animals << @animal 
        redirect to "/account/#{@user.id}/animals"
    end

    get '/account/:id/animals/:animal_id/delete' do
        #delete the specified animal
        @user = Zookeeper.find_by_id(params[:id])
        Animal.find(params[:animal_id]).destroy
        redirect to "/account/#{@user.id}/animals"
    end

end