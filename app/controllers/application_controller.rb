class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes=Recipe.all
    erb :index
  end

  #new recipe
  get '/recipes/new' do
    erb :new
  end

  #create to save
  post '/recipes' do
    @recipe = Recipe.new(params)
    @recipe.save
    redirect to '/recipes/#{@recipe.id}'
  end

  #show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #edit part 1
  get '/recipes/:id/edit' do
    @recipe=Recipe.find(params[:id])
    erb :edit
  end

  #edit part 2
  patch '/receipts/:id' do
    @recipe=Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    erb :show
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    erb :index
  end

end