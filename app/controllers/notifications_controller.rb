class NotificationsController < ApplicationController
  before_action :set_activities, only: [:read_all]

  def index
    @activities = PublicActivity::Activity.where(recipient_id: current_user.id).order(:created_at => :desc)  
  end 

  def read_all
    PublicActivity::Activity.where(recipient_id: current_user.id).update_all({readed: true})
  end

  def set_activities
    @activities = PublicActivity::Activity.where(recipient_id: current_user.id)
  end
end

