class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  enable :sessions, :method_override

  set :views, File.expand_path('../../views', __FILE__)

  not_found do
    title 'Not Found!'
    view :not_found
  end

  def view(template)
    slim template, layout: :main
  end
end