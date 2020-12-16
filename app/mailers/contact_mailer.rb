class ContactMailer < ApplicationMailer
  def when_edited

    @user = params[:user]
    @article = params[:article]
    # params ==> {key: value}
    mail(to: 'user.email')

  end 
end