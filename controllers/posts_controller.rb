class PostsController < ApplicationController
  get '/posts' do
    title 'Posts'
    view :'/posts/index'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    view :'/posts/show'
  end
end