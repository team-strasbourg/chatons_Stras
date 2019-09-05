# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'no-reply@chatons.fr'

  def welcome_email(user)
    @user = user
    @url  = 'https://chatons-stras-staging.herokuapp.com'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def deliver_order(user, order)
    @jtoi_array = JoinTableOrderItem.where(order_id: order.id).to_a

    @images = []

    @jtoi_array.each do |o|
      @image = if o.item.avatar_attached?
                 o.item.avatar
               else
                 o.item.image_url
               end

      @images << @image
      if o.item.avatar_attached?
        attachments.inline[@image.to_s]
      else
        attachments.inline[@image.to_s] = File.read("app/assets/images/#{@image}")
      end
    end

    @user = user
    mail(to: @user.email, subject: 'Ta commande')
  end
end
