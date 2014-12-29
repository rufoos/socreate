class PostsController < ApplicationController
  get '/posts' do
    title 'Posts'
    view :'/posts/index'
  end

  get '/posts/:id' do
    view :'/posts/show'
  end
end