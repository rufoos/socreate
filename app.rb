require 'rubygems'
require 'bundler'
require 'sinatra/base'
require 'rack/mount'

require 'bson'
require 'mongoid'
require 'genghis'

require 'sinatra/assetpack'

Bundler.require

Dir.glob('./{helpers,controllers,models}/*.rb').each{|file| require file}

Routes = Rack::Mount::RouteSet.new do |set|
  set.add_route IndexController, { request_method: 'GET', path_info: %r{^/$} }, {}, :index
  set.add_route PostsController, { request_method: 'GET', path_info: %r{^/posts/new$} }, {}, :post_new
  set.add_route PostsController, { request_method: 'GET', path_info: %r{^/posts/\w+/edit$} }, {}, :post_edit
  set.add_route PostsController, { request_method: 'POST', path_info: %r{^/posts/create$} }, {}, :post_create
  set.add_route PostsController, { request_method: 'POST', path_info: %r{^/posts/\w+/update$} }, {}, :post_update
  set.add_route PostsController, { request_method: 'GET', path_info: %r{^/posts.*$} }, {}, :posts
  # TODO: исправить путь до assets genghis
  # request.script_name всегда пустое
  set.add_route Genghis::Server.new, { request_method: 'GET', path_info: %r{^/genghis$} }, {}, :genghis
end