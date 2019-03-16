# application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'
end

# user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'ご登録ありがとうございます！')
  end
end
