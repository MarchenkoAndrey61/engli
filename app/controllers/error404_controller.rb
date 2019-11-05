class Error404Controller < ApplicationController
  def error
    render 'error404/error', :status => 404, :eror404 => 'error'
  end
end
