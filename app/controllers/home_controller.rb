class HomeController < ApplicationController
  layout :set_layout

  def index
    render "index"
  end


  private
  def setLayout
    _layout = ""
    if !(current_user)
      _layout= "default"
    else
      _layout= "admin"
    end
    _layout
  end

end