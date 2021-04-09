class UserMailer < ApplicationMailer

  def proposal_email
    @user_email = params[:user_email]
    @product = params[:product]
    mail(to: @product.user.email, subject: 'Привіт, хтось хоче отримати Вашу річ')
  end
end
