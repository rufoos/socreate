class PostsController < ApplicationController
  before '/posts/\w+/?(edit|update|)' do
    set_post
  end

  get '/posts' do
    title 'Posts'
    view :'/posts/index'
  end

  get '/posts/new' do
    view :'/posts/new'
  end

  get '/posts/:id' do
    view :'/posts/show'
  end

  get '/posts/:id/edit' do
    view :'/posts/edit'
  end

  post '/posts/create' do
    @post = Post.create!(params[:post])
    view :'/posts/show'
  end

  post '/posts/:id/update' do
    @post.update_attributes(params[:post])
    view :'/posts/show'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end