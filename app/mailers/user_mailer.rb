class UserMailer < ApplicationMailer
  default from: 'no-reply@chatons.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://chatons-stras-staging.herokuapp.com' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def deliver_order(user, order)
    @jtoi_array = JoinTableOrderItem.where(order_id:order.id).to_a

    @jtoi_array.each do |o| 
      if o.item.avatar_attached?
        @image = o.item.avatar
      else 
        @image = o.item.image_url
      end
      
      if o.item.avatar_attached?
        # Pour les images que l'admin a mis en ligne
        attachments.inline["#{@image}"] = File.read(@image.blob.service.send(:path_for, @image.key))

      else
        # Pour les images normales
        attachments.inline["#{@image}"] = File.read("app/assets/images/#{@image}")
      end
      
    
    end
    
    @user = user 

    mail(to: @user.email, subject: 'Ta commande') 
  end

end
