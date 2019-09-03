class UserMailer < ApplicationMailer
  default from: 'no-reply@chatons.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://chatons-stras-staging.herokuapp.com' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end
