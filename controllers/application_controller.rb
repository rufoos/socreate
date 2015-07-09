class ApplicationController < Sinatra::Base
  helpers ApplicationHelper
  register Sinatra::AssetPack

  enable :sessions, :method_override

  set :views, File.expand_path('../../views', __FILE__)

  # Mongo config
  configure do
    mongo_config = File.expand_path('../config/mongoid.yml', File.dirname(__FILE__))
    Mongoid.load!(mongo_config)
  end

  not_found do
    title 'Not Found!'
    view :not_found
  end

  assets do
    # TODO
  end

  def view(template)
    slim template, layout: :main
  end
end