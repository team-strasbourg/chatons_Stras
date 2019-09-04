class UserMailer < ApplicationMailer
  default from: 'no-reply@chatons.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://chatons-stras-staging.herokuapp.com' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def deliver_order(user, order)
    
    @jtoi_array = JoinTableOrderItem.where(order_id:order.id).to_a
    puts '4' * 60
    puts @jtoi_array
    @jtoi_array.each do |o|
      puts o.item.image_url
    end
    
    attachments.inline['image.jpg'] = File.read('/path/to/image.jpg')
    @user = user 

    mail(to: @user.email, subject: 'Ta commande') 
  end

end
