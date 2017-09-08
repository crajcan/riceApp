class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Pivot | Account Activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Pivot | Password Reset"
  end
end
