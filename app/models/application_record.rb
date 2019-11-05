class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true 

  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'mail.google.com',
    :port           => 587,
    :email     => ENV['example@gmail.com'],
    :password       => ENV['password'],
    :authentication => :login,
    :enable_starttls_auto => true
}

end
            