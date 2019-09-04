class AdminMailer < ApplicationMailer
  default from: 'no-reply@chatons.fr'

  def notify_admin(admin, user, order)
    admin = User.where("admin = true")
    @user = user
    @order = order

    @mail(to: admin.email, subject: 'Ta commande') 
  end
end
