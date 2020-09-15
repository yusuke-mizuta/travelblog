class RequestsController < ApplicationController
  def index
  end

  def new
  	@request = Request.new
  end

  def show
  end
end
