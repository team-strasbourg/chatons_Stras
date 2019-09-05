class AdminMailer < ApplicationMailer
  default to: -> { User.where("admin = true").pluck(:email) },
          from: 'no-reply@chatons.fr'

  def notify_admin(user, order)
    @user = user
    @order = order
    mail(subject: "Commande nº#{@order.id}")
  end
end
