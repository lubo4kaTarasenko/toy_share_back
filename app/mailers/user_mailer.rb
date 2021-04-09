class UserMailer < ApplicationMailer
  def proposal_email
    @from_user = params[:from_user]
    @product_to_give = params[:product_to_give]
    @to_user = params[:to_user]
    @product_to_get = params[:product_to_get]

    mail(to: @to_user.email, subject: proposal_subject)
  end

  private

  def proposal_subject
    @product_to_get.kind == "обміняю" ? "Нова пропозиція обмінятись" : "Нова ропозиція забрати"
  end
end
