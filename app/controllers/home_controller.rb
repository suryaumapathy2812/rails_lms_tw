# frozen_string_literal: true

class HomeController < ApplicationController
  layout "application"


  def index
    @courses = Course.all
  end

end
