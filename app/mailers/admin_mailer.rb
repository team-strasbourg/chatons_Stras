class AdminMailer < ApplicationMailer
  default from: 'no-reply@chatons.fr'

  def notify_admin(admin, user, order)
    @user = user
    @order = order
  end
end
