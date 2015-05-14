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

  post '/posts' do
    @post = Post.create(params[:post])
  end
end