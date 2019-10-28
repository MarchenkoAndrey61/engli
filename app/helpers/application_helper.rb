module ApplicationHelper
  include ExampleHelper

  def date_formatter(date)

    date.strftime("%A %S %b %Y")

  end
  
  def notify_of_vote(vote, votable, voter)
    message = vote == 'up' ? 'liked your' : 'disliked your'
    votable.create_activity key: message, owner: voter, recipient: votable.user
  end
end


