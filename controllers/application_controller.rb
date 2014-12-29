class ApplicationController < Sinatra::Base
  include ApplicationHelper

  set :views, File.expand_path('../../views', __FILE__)

  # TODO: не срабатывает этот метод когда нужный роут не найден
  not_found do
    title 'Not Found!'
    view :not_found
  end

  def view(template)
    slim template, layout: :main
  end
end