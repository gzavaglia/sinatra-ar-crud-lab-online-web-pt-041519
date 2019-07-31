
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  #create
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end
  
  #read
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  #update
  get '/articles/:id/edit' do  #load edit form
    @article = Article.find_by_id(params[:id])
    @article.save
    erb :edit
  end
 
  patch '/articles/:id' do 
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{@article.id}"
  end
  #delete
  get 'models/:id/delete' do 
    erb :delete
  end
end
