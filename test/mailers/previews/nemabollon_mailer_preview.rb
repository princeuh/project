# Preview all emails at http://localhost:3000/rails/mailers/nemabollon_mailer
class NemabollonMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/nemabollon_mailer/account_activation
  def account_activation
  	user = Investor.first
  	user.activation_token = Investor.new_token
    NemabollonMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/nemabollon_mailer/password_reset
  def password_reset
    user = Investor.first
    user.activation_token = Investor.new_token
    NemabollonMailer.password_reset(user)
  end

end
