class UserMailer < ApplicationMailer
  default from: 'no-reply@chatons.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://chatons-stras-staging.herokuapp.com' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def deliver_order(user, order)
    @jtoi_array = JoinTableOrderItem.where(order_id:order.id).to_a
    # Ca sort un array des instances de JoinTableOrderItem associés à cet order 
    @images = []

    @jtoi_array.each do |o|
      @image = o.item.image_url
      # Je stocke l'URL de l'image dans @image
      @images << @image
      # Je mets @image dans l'array @images
      attachments.inline["#{@image}"] = File.read("app/assets/images/#{@image}")
      # Cette ligne permet de mettre les images en tant que pièce jointe dans le mail.
    end
    
    @user = user 

    mail(to: @user.email, subject: 'Ta commande') 
  end

end
