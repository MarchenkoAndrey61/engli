class NotificationsController < ApplicationController
  before_action :set_activities, only: [:read_all]
  def index
    @activities = PublicActivity::Activity.where(recipient_id: current_user.id)
end 

def read_all
  PublicActivity::Activity.where(recipient_id: current_user.id).update_all({readed: true})
  render 'index'
end

def set_activities
  @activities = PublicActivity::Activity.where(recipient_id: current_user.id)
end

end

