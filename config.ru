require 'rubygems'
require 'bundler'
require 'sinatra/base'
require 'rack/mount'

require 'bson'
require 'mongoid'

Bundler.require

Dir.glob('./{helpers,controllers,models}/*.rb').each{|file| require file}

Routes = Rack::Mount::RouteSet.new do |set|
  set.add_route IndexController, { path_info: %r{^/$} }, {}, :index
  set.add_route PostsController, { path_info: %r{^/posts/new$} }, {}, :posts
  set.add_route PostsController, { path_info: %r{^/posts.*$} }, {}, :posts
end

run Routes