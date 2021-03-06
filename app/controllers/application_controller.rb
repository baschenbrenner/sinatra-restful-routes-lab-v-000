require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes=Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe=Recipe.find(params[:id])
    erb :show
  end



  get '/recipes/:id/delete' do #delete action
  @recipe = Recipe.find(params[:id])
  @recipe.delete
  redirect to '/recipes'
  end

  post '/recipes/:id/delete' do #delete action
  @recipe = Recipe.find(params[:id])
  @recipe.delete
  redirect to '/recipes'
  end

  post '/recipes' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save

    redirect "/recipes/#{@recipe.id}"
  end

  post '/recipes/new' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end


  


end
