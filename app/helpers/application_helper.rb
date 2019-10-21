module ApplicationHelper
  include ExampleHelper

  def date_formatter(date)

    date.strftime("%A %S %b %Y")

  end

end


