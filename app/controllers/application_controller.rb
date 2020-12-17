
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    @article = Article.create(params[:article])
    redirect "/articles/#{@article.id}"
  end

  get '/articles/new' do
    erb :new
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    erb :index
  end

end
