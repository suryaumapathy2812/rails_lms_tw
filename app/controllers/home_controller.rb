class HomeController < ApplicationController
  layout "admin"


  def index
    render "index"
  end

end