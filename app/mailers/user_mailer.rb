class UserMailer < ApplicationMailer

  def proposal_email
    @user_email = params[:user_email]
    @product = params[:product]
    mail(to: @product.user.email, subject: 'Привіт, хтось хоче отримати Вашу річ')
  end

  def change_email
    @user_email = params[:user_email]
    @product = params[:product]
    @product_change
    mail(to: @product.user.email, subject: 'Привіт, хтось хоче обміняти Вашу річ')
  end
end
