class ApplicationController < ActionController::Base
  WillPaginate.per_page = 10

  before_action :authenticate_user!
end
