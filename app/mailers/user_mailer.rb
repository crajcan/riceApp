class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "#{APP_NAME} | Account Activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "#{APP_NAME} | Password Reset"
  end
end
