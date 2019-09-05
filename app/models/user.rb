# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend FriendlyId
  after_create :welcome_send

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  friendly_id :usermail, use: :slugged

  def usermail
    usermail = email.split('@')
    (usermail[0]).to_s
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end



end
