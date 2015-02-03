class IndexController < ApplicationController

  get '/' do
    title 'Index'
    view :'/posts/index'
  end

end