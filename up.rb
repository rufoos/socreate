require 'sinatra'

get '/' do
  slim :index, layout: :main
end

get '/posts' do
  slim :posts, layout: :main
end