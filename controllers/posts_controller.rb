class PostsController < ApplicationController

  get '/posts' do
    title 'Posts'
    view :'/posts/index'
  end

  get '/posts/new' do
    view :'/posts/new'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    view :'/posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    view :'/posts/edit'
  end

  post '/posts/create' do
    @post = Post.create!(params[:post])
    view :'/posts/show'
  end

  post '/posts/:id/update' do
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect to("/posts/#{@post.id}")
  end

end