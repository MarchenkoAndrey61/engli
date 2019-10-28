module NotificationsHelper
  
  def readed_circle(activity)
    class_name = activity.readed ? 'readed' : ''
    "<span class='glyphicon glyphicon-heart activity-item #{class_name}'></span>".html_safe
  end

end
