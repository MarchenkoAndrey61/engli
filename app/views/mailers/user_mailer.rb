class UserMailer < ActionMailer::Base
  default from: "sender@example.com"
  def sendMail(email)
  @greeting = "Hi"
  
  mail to: email, subject: "Your Subject"
  end
  end