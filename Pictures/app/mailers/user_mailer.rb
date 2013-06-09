class UserMailer < ActionMailer::Base
  default from: "Pictures.com"

 
  def firstemail(email)
  		mail(:to => email, :subject => "Welcome to Pictures")
  end
end
